import openai
import pyodbc
import random
from typing import List, Dict
from flask import Flask, render_template, request, jsonify
from flask_cors import CORS

# Thiết lập API key của OpenAI
openai.api_key = "sk-123"  # Thay bằng API key của bạn

# Khởi tạo Flask app
app = Flask(__name__)
CORS(app) 
# Kết nối tới database SQL Server
def connect_db():
    try:
        conn = pyodbc.connect(
            'DRIVER={ODBC Driver 17 for SQL Server};'
            'SERVER=THIENHOANNHAA;'
            'DATABASE=wiish;'
            'UID=sa;'
            'PWD=123;'  # Thay YOUR_PASSWORD bằng mật khẩu của tài khoản sa
        )
        return conn
    except pyodbc.Error as e:
        print(f"Lỗi kết nối database: {e}")
        raise

# Di chuyển hàm remove_diacritics ra ngoài để có thể sử dụng ở nhiều nơi
def remove_diacritics(text):
    """Hàm chuẩn hóa text không dấu"""
    text = text.lower()
    replacements = {
        'đ': 'd', 'á': 'a', 'à': 'a', 'ả': 'a', 'ã': 'a', 'ạ': 'a',
        'ă': 'a', 'ắ': 'a', 'ằ': 'a', 'ẳ': 'a', 'ẵ': 'a', 'ặ': 'a', 
        'â': 'a', 'ấ': 'a', 'ầ': 'a', 'ẩ': 'a', 'ẫ': 'a', 'ậ': 'a',
        'é': 'e', 'è': 'e', 'ẻ': 'e', 'ẽ': 'e', 'ẹ': 'e',
        'ê': 'e', 'ế': 'e', 'ề': 'e', 'ể': 'e', 'ễ': 'e', 'ệ': 'e',
        'ó': 'o', 'ò': 'o', 'ỏ': 'o', 'õ': 'o', 'ọ': 'o',
        'ô': 'o', 'ố': 'o', 'ồ': 'o', 'ổ': 'o', 'ỗ': 'o', 'ộ': 'o',
        'ơ': 'o', 'ớ': 'o', 'ờ': 'o', 'ở': 'o', 'ỡ': 'o', 'ợ': 'o',
        'ú': 'u', 'ù': 'u', 'ủ': 'u', 'ũ': 'u', 'ụ': 'u',
        'ư': 'u', 'ứ': 'u', 'ừ': 'u', 'ử': 'u', 'ữ': 'u', 'ự': 'u',
        'í': 'i', 'ì': 'i', 'ỉ': 'i', 'ĩ': 'i', 'ị': 'i',
        'ý': 'y', 'ỳ': 'y', 'ỷ': 'y', 'ỹ': 'y', 'ỵ': 'y'
    }
    for src, dst in replacements.items():
        text = text.replace(src, dst)
    return text

# Thêm một số câu mở đầu ngẫu nhiên để tăng tính đa dạng
def get_greeting() -> str:
    greetings = [
        "Xin chào! ",
        "Chào bạn! ",
        "Rất vui được hỗ trợ bạn! ",
        "Chào mừng bạn đến với shop! ",
        "Chào bạn nhé! ",
        ""  # Empty greeting for variety
    ]
    return random.choice(greetings)

def get_response_ending() -> str:
    endings = [
        " Bạn cần thêm thông tin gì nữa không? 😊",
        " Hy vọng thông tin này hữu ích cho bạn!",
        " Bạn có thắc mắc gì thêm không?",
        " Cần tư vấn thêm, bạn cứ hỏi nhé!",
        " Mình có thể giúp gì thêm cho bạn?",
        ""  # Empty ending for variety
    ]
    return random.choice(endings)

# Hàm tìm kiếm sản phẩm trong database
def search_products(query: str) -> List[Dict]:
    conn = connect_db()
    cursor = conn.cursor()
    
    print(f"Tìm kiếm với query: {query}")
    
    normalized_query = remove_diacritics(query)
    keywords = [kw for kw in normalized_query.split() if kw in ["tinh", "dau", "bac", "ha", "cam", "sa", "chanh", "buoi", "oai", "huong", "que", "tram"]]
    
    if not keywords:
        cursor.execute("SELECT pid, name, price, description, stock FROM Product WHERE 1=0")
    else:
        conditions = []
        for kw in keywords:
            conditions.append(f"""
                (LOWER(name) LIKE N'%{kw}%' 
                OR LOWER(description) LIKE N'%{kw}%'
                OR name COLLATE Latin1_General_CI_AI LIKE '%{kw}%'
                OR description COLLATE Latin1_General_CI_AI LIKE '%{kw}%')
            """)
        query_sql = f"""
            SELECT pid, name, price, description, stock 
            FROM Product 
            WHERE {' OR '.join(conditions)}
            AND status = 1
        """
        print(f"Debug - SQL Query: {query_sql}")  # Debug print
        cursor.execute(query_sql)
    
    results = cursor.fetchall()
    print(f"Số sản phẩm tìm thấy: {len(results)}")
    
    conn.close()
    
    products = [{
        "pid": row[0],
        "name": row[1],
        "price": float(row[2]),
        "description": row[3],
        "stock": row[4]
    } for row in results]
    return products

# Hàm gọi OpenAI để xử lý câu hỏi
def get_openai_response(prompt: str) -> str:
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "system", "content": """
Bạn là một chatbot bán hàng thông minh, giúp gợi ý sản phẩm và trả lời câu hỏi của khách hàng.
Shop có các danh mục sản phẩm:
1. Tinh dầu xông phòng
2. Tinh dầu xe hơi
3. Tinh dầu massage
4. Tinh dầu dạng xịt

Khi khách hỏi về danh mục, hãy giới thiệu các danh mục trên và đặc điểm của từng loại.
            """},
            {"role": "user", "content": prompt}
        ],
        max_tokens=150,
        temperature=0.7
    )
    return response.choices[0].message['content']

# Cập nhật hàm get_product_info để thêm cảm xúc và câu trả lời tự nhiên
def get_product_info(query: str) -> str:
    """Hàm lấy thông tin chi tiết về sản phẩm"""
    try:
        conn = connect_db()
        cursor = conn.cursor()
        
        normalized_query = remove_diacritics(query.lower())
        
        # Tìm sản phẩm cụ thể
        specific_products = {
            "bac ha": "bạc hà",
            "buoi": "bưởi", 
            "oai huong": "oải hương",
            "tram": "trầm",
            "que": "quế",
            "sa chanh": "sả chanh"
        }
        
        for key, value in specific_products.items():
            if key in normalized_query:
                cursor.execute("""
                    SELECT p.name, p.price, p.description, p.stock, c.categoryName
                    FROM Product p
                    JOIN Category c ON p.cateID = c.categoryID
                    WHERE LOWER(p.name) LIKE ? AND p.status = 1
                """, f"%{value}%")
                
                result = cursor.fetchone()
                if result:
                    intro = random.choice([
                        f"Về {result[0]} mà bạn hỏi, ",
                        f"Mình xin giới thiệu {result[0]} nhé! ",
                        f"Đây là thông tin về {result[0]} cho bạn: ",
                        f"Về sản phẩm {result[0]} mà bạn quan tâm, "
                    ])
                    
                    stock_status = ""
                    if result[3] > 10:
                        stock_status = f"💯 Còn nhiều hàng ({result[3]} sản phẩm)"
                    elif result[3] > 0:
                        stock_status = f"⚠️ Sắp hết hàng (chỉ còn {result[3]} sản phẩm)"
                    else:
                        stock_status = "❌ Hiện đang hết hàng"
                    
                    return f"""{intro}

🏷️ **{result[0]}**
💰 Giá: {result[1]:,.0f} VND
📋 Mô tả: {result[2]}
📦 Tình trạng: {stock_status}
🏆 Danh mục: {result[4]}

{get_response_ending()}"""
        
        conn.close()
        return None
        
    except Exception as e:
        print(f"Lỗi trong get_product_info: {str(e)}")
        return None

# Cập nhật hàm get_price_info để thêm cảm xúc và phản hồi đa dạng
def get_price_info(query: str) -> str:
    """Hàm lấy thông tin về giá sản phẩm"""
    try:
        conn = connect_db()
        cursor = conn.cursor()
        
        if "mắc nhất" in query or "đắt nhất" in query or "cao nhất" in query:
            cursor.execute("""
                SELECT TOP 3 name, price, description
                FROM Product
                WHERE status = 1
                ORDER BY price DESC
            """)
            results = cursor.fetchall()
            if results:
                intro = random.choice([
                    "Dạ, hiện tại shop có những sản phẩm cao cấp sau: ",
                    "Mình xin chia sẻ top 3 sản phẩm cao cấp nhất của shop: ",
                    "Đây là những sản phẩm có giá cao nhất của shop nhé: ",
                ])
                response = f"{intro}\n\n"
                for i, r in enumerate(results, 1):
                    response += f"{i}. **{r[0]}**: {r[1]:,.0f} VND\n   __{r[2]}__\n\n"
                return response + get_response_ending()
                
        elif "rẻ nhất" in query or "thấp nhất" in query:
            cursor.execute("""
                SELECT TOP 3 name, price, description
                FROM Product
                WHERE status = 1
                ORDER BY price ASC
            """)
            results = cursor.fetchall()
            if results:
                intro = random.choice([
                    "Dạ, hiện tại shop có những sản phẩm giá rẻ sau: ",
                    "Mình xin chia sẻ top 3 sản phẩm giá rẻ nhất của shop: ",
                    "Đây là những sản phẩm có giá thấp nhất của shop nhé: ",
                ])
                response = f"{intro}\n\n"
                for i, r in enumerate(results, 1):
                    response += f"{i}. **{r[0]}**: {r[1]:,.0f} VND\n   __{r[2]}__\n\n"
                return response + get_response_ending()
                
        elif "khoảng giá" in query or "tầm giá" in query:
            cursor.execute("""
                SELECT 
                    MIN(price) as min_price,
                    MAX(price) as max_price,
                    AVG(price) as avg_price
                FROM Product
                WHERE status = 1
            """)
            result = cursor.fetchone()
            if result:
                return f"""
Thông tin khoảng giá sản phẩm:
- Giá thấp nhất: {result[0]:,.0f} VND
- Giá cao nhất: {result[1]:,.0f} VND
- Giá trung bình: {result[2]:,.0f} VND
{get_response_ending()}
                """
        
        conn.close()
        return None
        
    except Exception as e:
        print(f"Lỗi trong get_price_info: {str(e)}")
        return None

# Cập nhật hàm get_products_by_category để hiển thị thông tin đầy đủ và có cấu trúc tốt hơn
def get_products_by_category(category_name: str) -> str:
    """Hàm lấy danh sách sản phẩm theo danh mục"""
    try:
        conn = connect_db()
        cursor = conn.cursor()
        
        # Chuẩn hóa tên category
        normalized_category = remove_diacritics(category_name.lower())
        
        # Map các từ khóa tìm kiếm với categoryID
        category_keywords = {
            "xong phong": 1,      # Tinh dầu xông phòng
            "xe hoi": 2,          # Tinh dầu xe hơi  
            "treo xe": 2,         # Thêm từ khóa phụ cho xe hơi
            "o to": 2,            # Thêm từ khóa phụ cho xe hơi 
            "oto": 2,             # Thêm từ khóa phụ cho xe hơi
            "xe": 2,              # Thêm từ khóa phụ cho xe hơi
            "massage": 3,         # Tinh dầu massage
            "xit": 4,             # Tinh dầu dạng xịt
            "dang xit": 4,        # Thêm từ khóa phụ
            "tinh dau xit": 4,    # Thêm từ khóa phụ
            "spray": 4            # Thêm từ khóa phụ
        }
        
        print(f"Đang tìm category với query: {normalized_category}")  # Debug
        
        # Kiểm tra xem có phải đang tìm tinh dầu dạng xịt không
        if "xit" in normalized_category or "dang xit" in normalized_category or "spray" in normalized_category:
            category_id = 4
        # Kiểm tra từ khóa treo xe hoặc liên quan đến xe
        elif "treo xe" in normalized_category or "xe hoi" in normalized_category or "o to" in normalized_category or "xe" in normalized_category:
            category_id = 2
        else:
            # Kiểm tra các từ khóa khác
            category_id = None
            for key, value in category_keywords.items():
                if key in normalized_category:
                    category_id = value
                    break
        
        if category_id:
            cursor.execute("""
                SELECT p.name, p.price, p.description, p.stock, c.categoryName
                FROM Product p
                JOIN Category c ON p.cateID = c.categoryID
                WHERE c.categoryID = ? AND p.status = 1
                ORDER BY p.price ASC
            """, category_id)
            
            results = cursor.fetchall()
            if results:
                category_name = results[0][4]  # Lấy tên category từ kết quả đầu tiên
                
                # Sử dụng câu mở đầu tốt hơn
                intro = f"""🌿 **Danh mục: {category_name}** 🌿

Mình rất vui được giới thiệu với bạn các sản phẩm thuộc danh mục {category_name} của shop:
"""
                # Format từng sản phẩm rõ ràng hơn
                product_list = ""
                for i, r in enumerate(results, 1):
                    product_list += f"""
✨ **{i}. {r[0]}**
   💰 Giá: {r[1]:,.0f} VND
   📝 {r[2]}
   📦 Tình trạng: {'✅ Còn hàng (' + str(r[3]) + ' sản phẩm)' if r[3] > 0 else '❌ Hết hàng'}
"""
                
                # Thêm lời khuyên phù hợp với danh mục
                tips = {
                    1: "💡 Tinh dầu xông phòng sẽ tạo không gian thơm mát, dễ chịu và giúp thư giãn.",
                    2: "💡 Tinh dầu xe hơi giúp không gian xe luôn thơm tho và tạo cảm giác thoải mái khi lái xe.",
                    3: "💡 Tinh dầu massage có thể giúp thư giãn cơ bắp và giảm căng thẳng một cách hiệu quả.",
                    4: "💡 Tinh dầu dạng xịt rất tiện lợi, dễ sử dụng và phù hợp với nhiều không gian khác nhau."
                }
                
                ending = tips.get(category_id, "") + "\n\n" + get_response_ending()
                
                return intro + product_list + ending
                
            else:
                return f"Hiện tại shop chưa có sản phẩm nào trong danh mục {category_name}. Bạn có thể tham khảo các danh mục khác nhé!"
            
        conn.close()
        return f"Xin lỗi, mình không tìm thấy danh mục phù hợp với yêu cầu của bạn. Bạn có thể cho mình biết rõ hơn về sản phẩm bạn đang tìm kiếm không?"
        
    except Exception as e:
        print(f"Lỗi trong get_products_by_category: {str(e)}")
        return f"Xin lỗi bạn! Mình đang gặp chút vấn đề khi tìm kiếm thông tin về danh mục này. Bạn có thể thử lại sau hoặc hỏi về một danh mục khác không?"

def get_category_name(cateID: int, cursor) -> str:
    """Hàm lấy tên danh mục"""
    cursor.execute("SELECT categoryName FROM Category WHERE categoryID = ?", cateID)
    result = cursor.fetchone()
    return result[0] if result else "Không xác định"

def get_product_recommendations() -> str:
    """Hàm giới thiệu và gợi ý sản phẩm theo danh mục"""
    try:
        conn = connect_db()
        cursor = conn.cursor()
        
        recommendations = """Xin giới thiệu các dòng sản phẩm tinh dầu tốt nhất của shop:

1. Tinh dầu xông phòng:
"""
        # Lấy sản phẩm xông phòng bán chạy
        cursor.execute("""
            SELECT TOP 3 name, price, description 
            FROM Product 
            WHERE cateID = 1 AND status = 1 
            ORDER BY price DESC
        """)
        results = cursor.fetchall()
        for r in results:
            recommendations += f"   - {r[0]}: {r[1]:,.0f} VND - {r[2]}\n"

        recommendations += "\n2. Tinh dầu xe hơi:\n"
        cursor.execute("""
            SELECT TOP 3 name, price, description 
            FROM Product 
            WHERE cateID = 2 AND status = 1 
            ORDER BY price DESC
        """)
        results = cursor.fetchall()
        for r in results:
            recommendations += f"   - {r[0]}: {r[1]:,.0f} VND - {r[2]}\n"

        recommendations += "\n3. Tinh dầu massage:\n"
        cursor.execute("""
            SELECT TOP 3 name, price, description 
            FROM Product 
            WHERE cateID = 3 AND status = 1 
            ORDER BY price DESC
        """)
        results = cursor.fetchall()
        for r in results:
            recommendations += f"   - {r[0]}: {r[1]:,.0f} VND - {r[2]}\n"

        recommendations += "\n4. Tinh dầu dạng xịt:\n"
        cursor.execute("""
            SELECT TOP 3 name, price, description 
            FROM Product 
            WHERE cateID = 4 AND status = 1 
            ORDER BY price DESC
        """)
        results = cursor.fetchall()
        for r in results:
            recommendations += f"   - {r[0]}: {r[1]:,.0f} VND - {r[2]}\n"

        recommendations += """
💡 Lời khuyên khi chọn tinh dầu:
- Tinh dầu xông phòng: Phù hợp cho không gian sống, làm việc
- Tinh dầu xe hơi: Giúp khử mùi và tạo không gian thư giãn khi lái xe
- Tinh dầu massage: An toàn cho da, giúp thư giãn cơ thể
- Tinh dầu dạng xịt: Tiện lợi, dễ sử dụng, phù hợp nhiều mục đích

Bạn có thể cho tôi biết bạn đang quan tâm đến loại nào không?"""

        conn.close()
        return recommendations

    except Exception as e:
        print(f"Lỗi trong get_product_recommendations: {str(e)}")
        return "Xin lỗi, hiện tại không thể lấy được thông tin gợi ý sản phẩm."

# Thêm hàm mới để xử lý câu hỏi về giao hàng và vận chuyển
def get_shipping_info(query: str) -> str:
    """Hàm trả lời các câu hỏi về giao hàng và vận chuyển"""
    query_lower = query.lower()
    
    # Câu hỏi về thời gian giao hàng
    if any(phrase in query_lower for phrase in ["thời gian giao hàng", "mất bao lâu", "khi nào nhận được", "giao trong bao lâu"]):
        return """🚚 **Thông tin về thời gian giao hàng:**

- Nội thành TP.HCM: 1-2 ngày làm việc
- Các tỉnh miền Nam: 2-3 ngày làm việc
- Các tỉnh miền Trung và miền Bắc: 3-5 ngày làm việc
- Khu vực miền núi và hải đảo: 5-7 ngày làm việc

⏰ Lưu ý: Thời gian giao hàng có thể thay đổi tùy theo điều kiện thời tiết và tình trạng vận chuyển.

Bạn có thể cung cấp địa chỉ cụ thể để mình kiểm tra thời gian giao hàng chính xác hơn."""

    # Câu hỏi về phí vận chuyển
    elif any(phrase in query_lower for phrase in ["phí vận chuyển", "phí giao hàng", "ship bao nhiêu", "cước vận chuyển"]):
        return """💰 **Thông tin về phí vận chuyển:**

- Nội thành TP.HCM: 15,000 VND
- Các tỉnh thành khác: 30,000 - 50,000 VND tùy khu vực
- Miễn phí vận chuyển cho đơn hàng từ 500,000 VND

📦 Shop sử dụng các đơn vị vận chuyển uy tín như GHTK, GHN, Viettel Post để đảm bảo hàng đến tay bạn an toàn nhất."""

    # Câu hỏi về hình thức thanh toán
    elif any(phrase in query_lower for phrase in ["thanh toán", "trả tiền", "hình thức thanh toán", "cod"]):
        return """💳 **Các hình thức thanh toán:**

1. Thanh toán khi nhận hàng (COD)
2. Chuyển khoản ngân hàng
3. Ví điện tử (Momo, ZaloPay, VNPay)
4. Thẻ tín dụng/ghi nợ

Bạn có thể chọn phương thức thanh toán phù hợp khi tiến hành đặt hàng nhé!"""

    # Thông tin đổi trả
    elif any(phrase in query_lower for phrase in ["đổi trả", "hoàn tiền", "bảo hành", "đổi sản phẩm"]):
        return """🔄 **Chính sách đổi trả:**

- Thời gian đổi trả: Trong vòng 7 ngày kể từ khi nhận hàng
- Điều kiện: Sản phẩm còn nguyên vẹn, chưa sử dụng, còn đầy đủ bao bì
- Lý do đổi trả: Sản phẩm lỗi, hỏng, không đúng mô tả

⚠️ Lưu ý: Tinh dầu là sản phẩm đặc biệt, chỉ được đổi trả khi sản phẩm bị lỗi từ nhà sản xuất."""
    
    # Không tìm thấy thông tin phù hợp
    return None

# Cập nhật hàm chatbot_response với thứ tự ưu tiên hợp lý
def chatbot_response(user_input: str) -> str:
    try:
        input_lower = user_input.lower()
        greeting = get_greeting()
        
        # Xử lý câu hỏi về danh mục tinh dầu dạng xịt - đặt ưu tiên cao nhất
        if ("tinh dầu" in input_lower and "xịt" in input_lower) or "dạng xịt" in input_lower:
            category_products = get_products_by_category("tinh dầu dạng xịt")
            if category_products:
                return f"{greeting}{category_products}"
        
        # Kiểm tra xem có phải đang tìm một sản phẩm cụ thể không - ĐẶT LÊN ĐẦU
        if "tinh dầu" in input_lower:
            product_info = get_product_info(input_lower)
            if product_info:
                return product_info
        
        # Thêm điều kiện xử lý câu hỏi về giá - ĐẶT THỨ HAI
        if any(keyword in input_lower for keyword in ["mắc nhất", "đắt nhất", "rẻ nhất", "khoảng giá", "tầm giá", "cao nhất", "thấp nhất", "giá bao nhiêu", "bao nhiêu tiền"]):
            price_info = get_price_info(input_lower)
            if price_info:
                return f"{greeting}{price_info}"
                
        # Thêm điều kiện xử lý yêu cầu giới thiệu sản phẩm
        if any(keyword in input_lower for keyword in ["giới thiệu", "loại nào tốt", "gợi ý", "tư vấn", "quan tâm"]):
            # Kiểm tra nếu đề cập tới danh mục cụ thể
            if "xông phòng" in input_lower or "xe hơi" in input_lower or "massage" in input_lower or "xịt" in input_lower:
                category_products = get_products_by_category(input_lower)
                if category_products:
                    return f"{greeting}{category_products}"
            return get_product_recommendations()
            
        # Thêm điều kiện kiểm tra category
        if any(keyword in input_lower for keyword in ["danh mục", "loại", "nhóm"]):
            category_products = get_products_by_category(input_lower)
            if category_products:
                return f"{greeting}{category_products}"
        
        # 1. Câu hỏi về công dụng sản phẩm
        if any(keyword in input_lower for keyword in ["công dụng", "tác dụng", "để làm gì", "dùng để"]):
            product_info = get_product_info(input_lower)
            if product_info:
                return product_info
            return f"{greeting}{get_openai_response(user_input)}"
            
        # 2. Câu hỏi về giá và khuyến mãi
        if any(keyword in input_lower for keyword in ["giá", "khuyến mãi", "giảm giá", "combo"]):
            product_info = get_product_info(input_lower)
            if product_info:
                return product_info
            return f"{greeting}Hiện tại shop đang có chương trình mua 3 tặng 1 với một số sản phẩm tinh dầu xông phòng! Bạn có muốn mình giới thiệu cụ thể không?"
        
        # Thay đổi phần mặc định tìm kiếm sản phẩm
        if any(keyword in input_lower for keyword in ["tìm", "có", "gợi ý"]):
            products = search_products(user_input)
            if products:
                intro = random.choice([
                    "Mình tìm thấy một số sản phẩm phù hợp với yêu cầu của bạn: ",
                    "Đây là những sản phẩm mà mình nghĩ bạn sẽ thích: ",
                    "Shop có những sản phẩm sau đây phù hợp với nhu cầu của bạn: ",
                ])
                product_list = "\n\n".join([
                    f"✨ **{p['name']}**\n  💰 {p['price']:,.0f} VND\n  📝 {p['description']}" 
                    for p in products
                ])
                return f"{greeting}{intro}\n\n{product_list}\n\n{get_response_ending()}"
        
        # Thêm phản hồi cá nhân hóa - ĐẶT SAU CÙNG
        if "chào" in input_lower or "hello" in input_lower or "hi" in input_lower:
            return f"Chào bạn! 👋 Mình là trợ lý của shop tinh dầu. Mình có thể giúp gì cho bạn hôm nay?"
        
        # Xử lý câu hỏi về giao hàng và vận chuyển
        if any(keyword in input_lower for keyword in ["giao hàng", "vận chuyển", "ship", "thời gian", "phí", "thanh toán", "đổi trả"]):
            shipping_info = get_shipping_info(input_lower)
            if shipping_info:
                return f"{greeting}{shipping_info}"
        
        # Sử dụng OpenAI cho các câu hỏi khác
        return f"{greeting}{get_openai_response(user_input)}"
        
    except Exception as e:
        return f"Xin lỗi bạn! 🙇‍♂️ Mình đang gặp chút vấn đề kỹ thuật: {str(e)}. Bạn có thể thử lại sau hoặc liên hệ với shop qua hotline 1900xxxx nhé!"

# Route cho trang chính
@app.route('/')
def index():
    return render_template('index.html')

# Route xử lý tin nhắn từ người dùng
@app.route('/chat', methods=['POST'])
def chat():
    user_input = request.json.get('message')
    response = chatbot_response(user_input)
    return jsonify({'response': response})

# Chạy ứng dụng
if __name__ == "__main__":
    try:
        # Kiểm tra kết nối database trước khi chạy
        conn = connect_db()
        print("Kết nối database thành công!")
        conn.close()
    except Exception as e:
        print(f"Lỗi kết nối khi khởi động: {e}")
    app.run(debug=True, host='localhost', port=5000)