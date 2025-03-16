<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wiish Shop - Chatbot</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
        }
        .chat-container {
            max-width: 500px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .chat-header {
            background: linear-gradient(135deg, #43a047 0%, #2e7d32 100%);
            color: white;
            padding: 15px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .chat-header h3 {
            font-weight: 600;
            display: flex;
            align-items: center;
        }
        .chat-header h3 i {
            margin-right: 10px;
            font-size: 20px;
        }
        .chat-body {
            height: 400px;
            overflow-y: auto;
            padding: 20px;
            background-image: url('https://i.pinimg.com/originals/97/c0/07/97c00759d64bc359648d5b3c7a511f25.jpg');
            background-size: cover;
            background-position: center;
        }
        .chat-message {
            margin-bottom: 15px;
            max-width: 80%;
            padding: 12px 15px;
            border-radius: 18px;
            font-size: 15px;
            position: relative;
            line-height: 1.5;
        }
        .user-message {
            background-color: #e3f2fd;
            color: #0d47a1;
            margin-left: auto;
            border-bottom-right-radius: 5px;
        }
        .bot-message {
            background-color: white;
            color: #333;
            margin-right: auto;
            border-bottom-left-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .bot-message img.bot-avatar {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            position: absolute;
            bottom: -5px;
            left: -35px;
        }
        .chat-input {
            display: flex;
            padding: 15px;
            background-color: #f5f5f5;
            border-top: 1px solid #e0e0e0;
        }
        .chat-input input {
            flex: 1;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 25px;
            outline: none;
            font-size: 15px;
        }
        .chat-input button {
            background-color: #43a047;
            color: white;
            border: none;
            border-radius: 50%;
            width: 45px;
            height: 45px;
            margin-left: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .chat-input button:hover {
            background-color: #2e7d32;
        }
        .loading-dots {
            display: inline-block;
        }
        .loading-dots span {
            animation: dots 1.5s infinite;
            font-size: 20px;
        }
        .loading-dots span:nth-child(2) {
            animation-delay: 0.5s;
        }
        .loading-dots span:nth-child(3) {
            animation-delay: 1s;
        }
        @keyframes dots {
            0%, 20% {
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }
        .markdown {
            white-space: pre-wrap;
        }
        .markdown strong, .markdown b {
            font-weight: bold;
        }
        .markdown em, .markdown i {
            font-style: italic;
        }
    </style>
</head>
<body>
    <div class="chat-container">
        <div class="chat-header">
            <h3><i class="fas fa-robot"></i> Wiish Shop Chatbot</h3>
            <div>
                <i class="fas fa-times" style="cursor: pointer;" onclick="closeChatbot()"></i>
            </div>
        </div>
        <div class="chat-body" id="chatBody">
            <div class="chat-message bot-message">
                <img src="https://cdn-icons-png.flaticon.com/512/4712/4712010.png" class="bot-avatar" alt="Bot">
                Xin chào! Mình là trợ lý ảo của Wiish Shop. Bạn cần tôi tư vấn gì về tinh dầu không?
            </div>
        </div>
        <div class="chat-input">
            <input type="text" id="userInput" placeholder="Nhập tin nhắn của bạn..." onkeypress="if(event.key === 'Enter') sendMessage()">
            <button onclick="sendMessage()"><i class="fas fa-paper-plane"></i></button>
        </div>
    </div>

    <script>
        // Hàm chuyển đổi định dạng markdown đơn giản
        function markdownToHtml(text) {
            // Xử lý bold (**text**)
            text = text.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>');
            
            // Xử lý italic (*text*)
            text = text.replace(/\*(.*?)\*/g, '<em>$1</em>');
            
            // Xử lý xuống dòng
            text = text.replace(/\n/g, '<br>');
            
            // Emoji không cần xử lý vì HTML hiển thị được
            
            return text;
        }
        
        function sendMessage() {
            const userInput = document.getElementById('userInput');
            const message = userInput.value.trim();
            
            if (message === '') return;
            
            // Hiển thị tin nhắn người dùng
            const chatBody = document.getElementById('chatBody');
            chatBody.innerHTML += `
                <div class="chat-message user-message">
                    ${message}
                </div>
            `;
            
            // Xóa input
            userInput.value = '';
            
            // Hiển thị đang typing
            chatBody.innerHTML += `
                <div class="chat-message bot-message" id="typingIndicator">
                    <img src="https://cdn-icons-png.flaticon.com/512/4712/4712010.png" class="bot-avatar" alt="Bot">
                    <div class="loading-dots">
                        <span>.</span><span>.</span><span>.</span>
                    </div>
                </div>
            `;
            
            // Cuộn xuống dưới
            chatBody.scrollTop = chatBody.scrollHeight;
            
            // Gọi API chatbot
            fetch('chatbot?message=' + encodeURIComponent(message), {
                method: 'POST'
            })
            .then(response => response.json())
            .then(data => {
                // Xóa hiệu ứng đang typing
                const typingIndicator = document.getElementById('typingIndicator');
                if (typingIndicator) {
                    typingIndicator.remove();
                }
                
                // Hiển thị phản hồi của bot
                chatBody.innerHTML += `
                    <div class="chat-message bot-message">
                        <img src="https://cdn-icons-png.flaticon.com/512/4712/4712010.png" class="bot-avatar" alt="Bot">
                        <div class="markdown">${markdownToHtml(data.response)}</div>
                    </div>
                `;
                
                // Cuộn xuống dưới
                chatBody.scrollTop = chatBody.scrollHeight;
            })
            .catch(error => {
                // Xóa hiệu ứng đang typing
                const typingIndicator = document.getElementById('typingIndicator');
                if (typingIndicator) {
                    typingIndicator.remove();
                }
                
                // Hiển thị thông báo lỗi
                chatBody.innerHTML += `
                    <div class="chat-message bot-message">
                        <img src="https://cdn-icons-png.flaticon.com/512/4712/4712010.png" class="bot-avatar" alt="Bot">
                        Xin lỗi, hiện tại tôi không thể xử lý yêu cầu của bạn. Vui lòng thử lại sau.
                    </div>
                `;
                
                // Cuộn xuống dưới
                chatBody.scrollTop = chatBody.scrollHeight;
                
                console.error('Error:', error);
            });
        }
        
        function closeChatbot() {
            // Thêm logic để đóng chatbot
            window.history.back();
        }
    </script>
</body>
</html>