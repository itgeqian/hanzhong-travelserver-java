<template>
  <div class="bottom">
    <div class="footer-content">
      <div class="footer-section">
        <h3 class="footer-title">
          <i class="footer-icon">🏛️</i>
          汉中旅游服务平台
        </h3>
        <p class="footer-description">
          探索汉中千年文化，体验自然山水之美。我们致力于为游客提供最优质的旅游服务和难忘的旅行体验。
        </p>
        <div class="social-links">
          <div class="social-item">
            <i class="social-icon">📱</i>
            <span>微信公众号</span>
          </div>
          <div class="social-item">
            <i class="social-icon">📞</i>
            <span>客服热线</span>
          </div>
          <div class="social-item">
            <i class="social-icon">✉️</i>
            <span>邮箱咨询</span>
          </div>
        </div>
      </div>
      
      <div class="footer-section">
        <h4 class="section-title">快速导航</h4>
        <ul class="footer-links">
          <li><a href="#" @click.prevent="toPage('index')">🏠 系统主页</a></li>
          <li><a href="#" @click.prevent="toPage('attractions')">🏛️ 景点介绍</a></li>
          <li><a href="#" @click.prevent="toPage('line')">🗺️ 旅游线路</a></li>
          <li><a href="#" @click.prevent="toPage('hotel')">🏨 景区酒店</a></li>
          <li><a href="#" @click.prevent="toPage('food')">🍜 美食推荐</a></li>
        </ul>
      </div>
      
      <div class="footer-section">
        <h4 class="section-title">服务支持</h4>
        <ul class="footer-links">
          <li><a href="#" @click.prevent="toPage('culture')">🎭 汉文化活动</a></li>
          <li><a href="#" @click.prevent="toPage('forum')">📖 旅游攻略</a></li>
          <li><a href="#" @click.prevent="toPage('contact')">📧 联系我们</a></li>
          <li><a href="#" @click.prevent="toPage('favor')">❤️ 我的收藏</a></li>
          <li><a href="#" @click.prevent="toPage('order')">📋 我的订单</a></li>
        </ul>
      </div>
      
      <div class="footer-section">
        <h4 class="section-title">联系信息</h4>
        <div class="contact-info">
          <div class="contact-item">
            <i class="contact-icon">📍</i>
            <span>陕西省汉中市</span>
          </div>
          <div class="contact-item">
            <i class="contact-icon">🕐</i>
            <span>服务时间：9:00-18:00</span>
          </div>
          <div class="contact-item">
            <i class="contact-icon">🌐</i>
            <span>官方网站</span>
          </div>
        </div>
      </div>
    </div>
    
    <div class="footer-bottom">
      <div class="copyright">
        <p>&copy; 2024 汉中旅游服务平台. 保留所有权利</p>
        <p class="slogan">让每一次旅行都成为美好回忆 ✨</p>
      </div>
      <div class="footer-decoration">
        <div class="decoration-element">🌸</div>
        <div class="decoration-element">🦋</div>
        <div class="decoration-element">🏮</div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return{

      }
    },
    methods: {
      toPage(name) {
        if (name == "index") {
          this.$router.push("/")
        } else if (name == "attractions") {
          this.$router.push("/attractions")
        } else if (name == "line") {
          this.$router.push("/line")
        } else if (name == "hotel") {
          this.$router.push("/hotel")
        } else if (name == "food") {
          this.$router.push("/food")
        } else if (name == "culture") {
          this.$router.push("/culture")
        } else if (name == "forum") {
          this.$router.push("/forum")
        } else if (name == "contact") {
          this.$router.push("/contact")
        } else if (name == "manage") {
          window.open("http://localhost:3000")
        } else if (name == "car") {
          this.$router.push("/car")
        } else if (name == "favor") {
          this.$router.push("/favor")
        } else if (name == "order") {
          this.$router.push("/order")
        } else if (name == "appointment") {
          this.$router.push("/appointment")
        }
      }
    },
 }
</script>

<style scoped>
  .bottom {
    background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
    color: white;
    font-family: 'PingFang SC', 'Microsoft YaHei', '微软雅黑', sans-serif;
    position: relative;
    overflow: hidden;
  }
  
  .bottom::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 4px;
    background: linear-gradient(90deg, #667eea, #764ba2);
  }
  
  .footer-content {
    display: grid;
    grid-template-columns: 2fr 1fr 1fr 1fr;
    gap: 40px;
    padding: 60px 5% 40px;
    max-width: 1200px;
    margin: 0 auto;
  }
  
  .footer-section {
    animation: fadeInUp 0.8s ease-out;
  }
  
  .footer-section:nth-child(2) { animation-delay: 0.2s; }
  .footer-section:nth-child(3) { animation-delay: 0.4s; }
  .footer-section:nth-child(4) { animation-delay: 0.6s; }
  
  @keyframes fadeInUp {
    from {
      opacity: 0;
      transform: translateY(30px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }
  
  .footer-title {
    font-size: 24px;
    font-weight: 700;
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    gap: 10px;
    background: linear-gradient(45deg, #667eea, #764ba2);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }
  
  .footer-icon {
    font-size: 28px;
    animation: pulse 2s infinite;
  }
  
  @keyframes pulse {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.1); }
  }
  
  .footer-description {
    color: rgba(255, 255, 255, 0.8);
    line-height: 1.6;
    margin-bottom: 25px;
    font-size: 14px;
  }
  
  .social-links {
    display: flex;
    flex-direction: column;
    gap: 12px;
  }
  
  .social-item {
    display: flex;
    align-items: center;
    gap: 10px;
    color: rgba(255, 255, 255, 0.7);
    font-size: 14px;
    transition: all 0.3s ease;
    cursor: pointer;
  }
  
  .social-item:hover {
    color: #667eea;
    transform: translateX(5px);
  }
  
  .social-icon {
    font-size: 16px;
  }
  
  .section-title {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 20px;
    color: #667eea;
    position: relative;
  }
  
  .section-title::after {
    content: '';
    position: absolute;
    bottom: -5px;
    left: 0;
    width: 30px;
    height: 2px;
    background: linear-gradient(90deg, #667eea, #764ba2);
    border-radius: 1px;
  }
  
  .footer-links {
    list-style: none;
    padding: 0;
    margin: 0;
  }
  
  .footer-links li {
    margin-bottom: 12px;
  }
  
  .footer-links a {
    color: rgba(255, 255, 255, 0.7);
    text-decoration: none;
    font-size: 14px;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    gap: 8px;
  }
  
  .footer-links a:hover {
    color: #667eea;
    transform: translateX(5px);
  }
  
  .contact-info {
    display: flex;
    flex-direction: column;
    gap: 15px;
  }
  
  .contact-item {
    display: flex;
    align-items: center;
    gap: 10px;
    color: rgba(255, 255, 255, 0.7);
    font-size: 14px;
  }
  
  .contact-icon {
    font-size: 16px;
    color: #667eea;
  }
  
  .footer-bottom {
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    padding: 30px 5%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: rgba(0, 0, 0, 0.2);
  }
  
  .copyright {
    text-align: left;
  }
  
  .copyright p {
    margin: 0;
    color: rgba(255, 255, 255, 0.6);
    font-size: 13px;
    line-height: 1.5;
  }
  
  .slogan {
    font-style: italic;
    color: #667eea !important;
    font-weight: 500;
  }
  
  .footer-decoration {
    display: flex;
    gap: 15px;
  }
  
  .decoration-element {
    font-size: 20px;
    animation: float 3s ease-in-out infinite;
    opacity: 0.6;
  }
  
  .decoration-element:nth-child(1) { animation-delay: 0s; }
  .decoration-element:nth-child(2) { animation-delay: 1s; }
  .decoration-element:nth-child(3) { animation-delay: 2s; }
  
  @keyframes float {
    0%, 100% { transform: translateY(0px); }
    50% { transform: translateY(-10px); }
  }
  
  /* 响应式设计 */
  @media (max-width: 992px) {
    .footer-content {
      grid-template-columns: 1fr 1fr;
      gap: 30px;
      padding: 40px 5% 30px;
    }
    
    .footer-bottom {
      flex-direction: column;
      gap: 20px;
      text-align: center;
    }
  }
  
  @media (max-width: 576px) {
    .footer-content {
      grid-template-columns: 1fr;
      gap: 25px;
      padding: 30px 5% 20px;
    }
    
    .footer-title {
      font-size: 20px;
    }
    
    .section-title {
      font-size: 16px;
    }
    
    .footer-decoration {
      justify-content: center;
    }
  }
</style>
