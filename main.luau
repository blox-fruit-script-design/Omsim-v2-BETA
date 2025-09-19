<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Omsim v2 BETA - Blox Fruits Executor</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: #fff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .executor-container {
            width: 100%;
            max-width: 800px;
            background: rgba(15, 15, 25, 0.9);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            border: 1px solid #4a7bcc;
        }
        
        .header {
            background: linear-gradient(90deg, #1a2b3f, #2a4b7c);
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #4a7bcc;
        }
        
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #4a9fff;
            text-shadow: 0 0 10px rgba(74, 159, 255, 0.7);
        }
        
        .version {
            background: #4a9fff;
            color: #0f2027;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
        }
        
        .tabs {
            display: flex;
            background: #152335;
            border-bottom: 1px solid #2a4b7c;
        }
        
        .tab {
            padding: 12px 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            border-right: 1px solid #2a4b7c;
        }
        
        .tab.active {
            background: #1c2f4a;
            color: #4a9fff;
            border-bottom: 2px solid #4a9fff;
        }
        
        .tab:hover {
            background: #223553;
        }
        
        .script-area {
            padding: 20px;
            height: 200px;
            background: #0c111a;
            border-bottom: 1px solid #2a4b7c;
            overflow-y: auto;
        }
        
        .script-text {
            color: #aaccff;
            font-family: 'Courier New', monospace;
            font-size: 14px;
            line-height: 1.5;
            white-space: pre-wrap;
        }
        
        .controls {
            display: flex;
            padding: 15px;
            gap: 10px;
            background: #152335;
            border-bottom: 1px solid #2a4b7c;
        }
        
        .btn {
            padding: 10px 15px;
            border-radius: 5px;
            border: none;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .execute {
            background: linear-gradient(90deg, #2b8c4a, #3bb56b);
            color: white;
        }
        
        .execute:hover {
            background: linear-gradient(90deg, #3bb56b, #4cd683);
            box-shadow: 0 0 10px rgba(59, 181, 107, 0.5);
        }
        
        .clear {
            background: linear-gradient(90deg, #cc3b3b, #e05555);
            color: white;
        }
        
        .clear:hover {
            background: linear-gradient(90deg, #e05555, #ff6b6b);
            box-shadow: 0 0 10px rgba(224, 85, 85, 0.5);
        }
        
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
            padding: 20px;
        }
        
        .feature-btn {
            background: linear-gradient(90deg, #2a4b7c, #3a5b9c);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 8px;
            text-align: left;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }
        
        .feature-btn:hover {
            background: linear-gradient(90deg, #3a5b9c, #4a6bbc);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }
        
        .feature-icon {
            font-size: 20px;
        }
        
        .status-bar {
            background: #152335;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid #2a4b7c;
            font-size: 12px;
            color: #aaccff;
        }
        
        .status {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .status-indicator {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: #3bb56b;
        }
        
        .notification {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: #1a2b3f;
            color: #aaccff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            transform: translateX(150%);
            transition: transform 0.3s ease;
            border-left: 4px solid #4a9fff;
        }
        
        .notification.show {
            transform: translateX(0);
        }
        
        @media (max-width: 600px) {
            .features {
                grid-template-columns: 1fr;
            }
            
            .controls {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="executor-container">
        <div class="header">
            <div class="logo">Omsim Executor <span class="version">v2 BETA</span></div>
            <div class="status">
                <div class="status-indicator"></div>
                <span>Ready</span>
            </div>
        </div>
        
        <div class="tabs">
            <div class="tab active">Blox Fruits</div>
            <div class="tab">Executor</div>
            <div class="tab">Scripts</div>
            <div class="tab">Settings</div>
        </div>
        
        <div class="script-area">
            <div class="script-text">[Omsim v2 BETA] - Blox Fruits Executor Loaded
[Status] Ready to execute scripts
[Info] Select a feature from the buttons below</div>
        </div>
        
        <div class="controls">
            <button class="btn execute">Execute</button>
            <button class="btn clear">Clear</button>
        </div>
        
        <div class="features">
            <button class="feature-btn" onclick="activateFeature('Auto Bounty Hunt')">
                <span class="feature-icon">🎯</span>
                <span>Auto Bounty Hunt</span>
            </button>
            
            <button class="feature-btn" onclick="activateFeature('Boost Fps')">
                <span class="feature-icon">🚀</span>
                <span>Boost Fps</span>
            </button>
            
            <button class="feature-btn" onclick="activateFeature('Anti-Lag')">
                <span class="feature-icon">⚡</span>
                <span>Anti-Lag</span>
            </button>
            
            <button class="feature-btn" onclick="activateFeature('Anti-Ban')">
                <span class="feature-icon">🛡️</span>
                <span>Anti-Ban</span>
            </button>
            
            <button class="feature-btn" onclick="activateFeature('Anti-Kick')">
                <span class="feature-icon">👢</span>
                <span>Anti-Kick</span>
            </button>
            
            <button class="feature-btn" onclick="activateFeature('Aim Bot')">
                <span class="feature-icon">🎯</span>
                <span>Aim Bot</span>
            </button>
            
            <button class="feature-btn" onclick="activateFeature('Ultra Fast Attack')">
                <span class="feature-icon">⚔️</span>
                <span>Ultra Fast Attack</span>
            </button>
        </div>
        
        <div class="status-bar">
            <div>Omsim v2 BETA</div>
            <div>Blox Fruits Executor</div>
        </div>
    </div>
    
    <div class="notification" id="notification">
        Feature activated successfully!
    </div>

    <script>
        function activateFeature(featureName) {
            const scriptArea = document.querySelector('.script-text');
            scriptArea.innerHTML = `[Omsim] Activating ${featureName}...\n[Status] Feature enabled successfully!\n[Info] ${featureName} is now active in Blox Fruits`;
            
            showNotification(`${featureName} activated!`);
        }
        
        function showNotification(message) {
            const notification = document.getElementById('notification');
            notification.textContent = message;
            notification.classList.add('show');
            
            setTimeout(() => {
                notification.classList.remove('show');
            }, 3000);
        }
        
        // Add functionality to buttons
        document.querySelector('.execute').addEventListener('click', () => {
            showNotification('Script executed successfully!');
        });
        
        document.querySelector('.clear').addEventListener('click', () => {
            document.querySelector('.script-text').textContent = '[Omsim] Console cleared\n[Status] Ready to execute';
            showNotification('Console cleared!');
        });
        
        // Add tab functionality
        const tabs = document.querySelectorAll('.tab');
        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                tabs.forEach(t => t.classList.remove('active'));
                tab.classList.add('active');
            });
        });
    </script>
</body>
</html>
