<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- Inline CSS -->
<style>
/* Chat Widget Container */
#chat-widget {
    position: fixed;
    bottom: 20px;
    right: 20px;
    z-index: 9999;
    font-family: 'Poppins', sans-serif;
}

/* Chat Toggle Button (Bubble) */
#chat-toggle {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    border: none;
    background: linear-gradient(135deg, #007bff, #0056b3);
    color: white;
    font-size: 28px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    cursor: pointer;
    transition: all 0.3s ease;
}
#chat-toggle:hover { transform: scale(1.1); }

/* Chat Panel */
#chat-panel {
    width: 350px;
    height: 450px;
    background: white;
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.3);
    display: flex;
    flex-direction: column;
    overflow: hidden;
    position: fixed;
    bottom: 90px; /* Above button */
    right: 20px;
    opacity: 0;
    pointer-events: none;
    transform: translateY(20px);
    transition: all 0.3s ease;
}

/* Open state */
#chat-panel.open {
    opacity: 1;
    pointer-events: auto;
    transform: translateY(0);
}

/* Header */
#chat-header {
    background: linear-gradient(135deg, #007bff, #0056b3);
    color: white;
    padding: 12px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-weight: bold;
}

/* Messages Area */
#chat-messages {
    flex: 1;
    padding: 12px;
    background: #f7f9fc;
    overflow-y: auto;
    display: flex;
    flex-direction: column;
}

/* Message Styling */
.message {
    padding: 8px 12px;
    border-radius: 12px;
    margin-bottom: 8px;
    max-width: 80%;
    word-wrap: break-word;
    font-size: 14px;
}
.message.user { background: #d7e9ff; align-self: flex-end; }
.message.bot { background: #ffffff; border: 1px solid #e1e1e1; align-self: flex-start; }

/* Input Form */
#chat-form {
    display: flex;
    border-top: 1px solid #eee;
    padding: 10px;
}
#chat-input {
    flex: 1;
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 8px;
}
#chat-form button {
    background: #007bff;
    color: white;
    border: none;
    padding: 8px 14px;
    margin-left: 8px;
    border-radius: 8px;
    cursor: pointer;
}

/* Close button */
#chat-close {
    background: none;
    border: none;
    color: white;
    font-size: 18px;
    cursor: pointer;
}
</style>

<!-- HTML -->
<div id="chat-widget">
    <button id="chat-toggle">💬</button>

    <div id="chat-panel">
        <div id="chat-header">
            <span>DreamNaukri AI Assistant</span>
            <button id="chat-close">×</button>
        </div>
        <div id="chat-messages"></div>
        <form id="chat-form">
            <input id="chat-input" type="text" placeholder="Type your question..." autocomplete="off" required />
            <button type="submit">Send</button>
        </form>
    </div>
</div>

<!-- JS -->
<script>
(function() {
    const toggle = document.getElementById("chat-toggle");
    const panel = document.getElementById("chat-panel");
    const closeBtn = document.getElementById("chat-close");
    const form = document.getElementById("chat-form");
    const input = document.getElementById("chat-input");
    const messages = document.getElementById("chat-messages");

    // Toggle open/close
    toggle.addEventListener("click", () => {
        panel.classList.toggle("open");
        input.focus();
    });

    closeBtn.addEventListener("click", () => panel.classList.remove("open"));

    // Append message helper
    function appendMessage(text, who) {
        const div = document.createElement("div");
        div.classList.add("message", who);
        div.textContent = text;
        messages.appendChild(div);
        messages.scrollTop = messages.scrollHeight;
    }

    // Handle form submit
    form.addEventListener("submit", async (e) => {
        e.preventDefault();
        const text = input.value.trim();
        if (!text) return;

        // Show user message
        appendMessage(text, "user");
        input.value = "";

        // Show typing/loading message
        const loading = document.createElement("div");
        loading.classList.add("message", "bot");
        loading.textContent = "AI is typing...";
        messages.appendChild(loading);
        messages.scrollTop = messages.scrollHeight;

        try {
            // ✅ Create form data properly
            const formData = new FormData();
            formData.append("message", text);

            // ✅ Send POST request correctly
            const resp = await fetch("ChatServlet", {
                method: "POST",
                body: formData
            });

            // ✅ Read plain text (not JSON)
            const data = await resp.text();
            loading.remove();
            appendMessage(data, "bot");
        } catch (err) {
            loading.remove();
            appendMessage("⚠️ Error: Unable to connect to AI.", "bot");
            console.error("ChatServlet Error:", err);
        }
    });
})();
</script>
