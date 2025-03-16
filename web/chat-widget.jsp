<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chat Widget</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .chat-widget {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 9999;
        }
        
        .chat-button {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(135deg, #43a047 0%, #2e7d32 100%);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        
        .chat-popup {
            display: none;
            position: absolute;
            bottom: 80px;
            right: 0;
            width: 350px;
            height: 450px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .chat-header {
            background: linear-gradient(135deg, #43a047 0%, #2e7d32 100%);
            color: white;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .chat-body {
            height: 330px;
            padding: 15px;
            overflow-y: auto;
            background-color: #f5f5f5;
        }
        
        .chat-input {
            display: flex;
            padding: 10px;
            background-color: white;
            border-top: 1px solid #eee;
        }
        
        .chat-input input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 20px;
            outline: none;
        }
        
        .chat-input button {
            background-color: #43a047;
            color: white;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            margin-left: 10px;
            cursor: pointer;
        }
        
        .chat-message {
            margin-bottom: 10px;
            max-width: 80%;
            padding: 10px;
            border-radius: 15px;
        }
        
        .user-message {
            background-color: #e3f2fd;
            color: #0d47a1;
            margin-left: auto;
        }
        
        .bot-message {
            background-color: white;
            color: #333;
            margin-right: auto;
        }
    </style>
</head>
<body>
    <div class="chat-widget">
        <div class="chat-button" onclick="toggleChat()">
            <i class="fas fa-comment-dots" style="font-size: 24px;"></i>
        </div>
        
        <div class="chat-popup" id="chatPopup">
            <div class="chat-header">
                <h4>Wiish Shop Chatbot</h4>
                <i class="fas fa-times" style="cursor: pointer;" onclick="toggleChat()"></i>
            </div>
            
            <div class="chat-body" id="chatBody">
                <div class="chat-message bot-message">
                    Xin chào! Mình là trợ lý ảo của Wiish Shop. Bạn cần tôi tư vấn gì về tinh dầu không?
                </div>
            </div>
            
            <div class="chat-input">
                <input type="text" id="userInput" placeholder="Nhập tin nhắn..." onkeypress="if(event.key === 'Enter') sendMessage()">
                <button onclick="sendMessage()"><i class="fas fa-paper-plane"></i></button>
            </div>
        </div>
    </div>
    
    <script>
        function toggleChat() {
            const popup = document.getElementById('chatPopup');
            popup.style.display = popup.style.display === 'block' ? 'none' : 'block';
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
                        ${data.response}
                    </div>
                `;
                
                // Cuộn xuống dưới
                chatBody.scrollTop = chatBody.scrollHeight;
            })
            .catch(error => {
                console.error('Error:', error);
                
                // Xóa hiệu ứng đang typing
                const typingIndicator = document.getElementById('typingIndicator');
                if (typingIndicator) {
                    typingIndicator.remove();
                }
                
                // Hiển thị thông báo lỗi
                chatBody.innerHTML += `
                    <div class="chat-message bot-message">
                        Xin lỗi, hiện tại tôi không thể xử lý yêu cầu của bạn. Vui lòng thử lại sau.
                    </div>
                `;
                
                // Cuộn xuống dưới
                chatBody.scrollTop = chatBody.scrollHeight;
            });
        }
    </script>
</body>
</html>