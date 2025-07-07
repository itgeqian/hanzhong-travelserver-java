<template>
  <div class="header">
    <div class="header1">
      <div class="logo-section">
        <div class="logo-icon">🏛️</div>
        <h2 class="logo-text">汉中旅游服务平台</h2>
      </div>
      
      <div class="header4">
        <div class="menu-list">
            <div @click="toPage('index')" 
                 :class="['menu-item', { 'menu-active': $route.path == '/' }]">
              <span>系统主页</span>
              <div class="menu-underline"></div>
            </div>
            <div @click="toPage('attractions')" 
                 :class="['menu-item', { 'menu-active': $route.path == '/attractions' }]">
              <span>景点介绍</span>
              <div class="menu-underline"></div>
            </div>
            <div @click="toPage('line')" 
                 :class="['menu-item', { 'menu-active': $route.path == '/line' }]">
              <span>旅游线路</span>
              <div class="menu-underline"></div>
            </div>
            <div @click="toPage('hotel')" 
                 :class="['menu-item', { 'menu-active': $route.path == '/hotel' }]">
              <span>景区酒店</span>
              <div class="menu-underline"></div>
            </div>
            <div @click="toPage('food')" 
                 :class="['menu-item', { 'menu-active': $route.path == '/food' }]">
              <span>美食推荐</span>
              <div class="menu-underline"></div>
            </div>
            <div @click="toPage('culture')" 
                 :class="['menu-item', { 'menu-active': $route.path == '/culture' }]">
              <span>汉文化活动</span>
              <div class="menu-underline"></div>
            </div>
            <div @click="toPage('forum')" 
                 :class="['menu-item', { 'menu-active': $route.path == '/forum' }]">
              <span>旅游攻略</span>
              <div class="menu-underline"></div>
            </div>
            <div @click="toPage('contact')" 
                 :class="['menu-item', { 'menu-active': $route.path == '/contact' }]">
              <span>联系我们</span>
              <div class="menu-underline"></div>
            </div>
        </div>
      </div>
      
      <div class="header5">
        <div class="user-avatar-container" @click="toCenter">
          <img class="user-avatar" :src="$store.state.HOST + user.avatar">
          <div class="avatar-badge"></div>
        </div>
        <div class="logout-btn" @click="loginOut">
          <i class="logout-icon">🚪</i>
          <span>退出</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import {getUser} from "@/api/api";

  export default {
    data() {
      return{
        name: "",
        user: {},
        avatar: [],
      }
    },
    methods: {
      toCenter() {
        this.$router.push("/center")
      },
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
        } else if (name == "order") {
          this.$router.push("/order")
        } else if (name == "favor") {
          this.$router.push("/favor")
        }
      },
      getUserInfo() {
        getUser().then(res => {
          if(res.code == 1000) {
            this.user = res.data
            this.user.sex = res.data.sex + ""
            this.avatar[0] = this.$store.state.HOST + this.user.avatar
            console.log(this.user)
          } else {
            this.$notify.error({
              title: '错误',
              message: res.message
            });
          }
        })
      },
      loginOut() {
        this.$store.dispatch('logout').then(() => {
          window.localStorage.removeItem("user_info")
          window.localStorage.removeItem("user_token")
          this.$message({
              message: '退出成功',
              type: 'success'
          });
          setTimeout(function(){
              window.location.reload()
          },1000)
        })
      }
    },
    created() {

    },
    mounted() {
      this.getUserInfo()

    }
 }
</script>

<style scoped>
  .header {
    width: 100%;
    height: 80px;
    display: flex;
    flex-direction: column;
    align-items: center;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    position: sticky;
    top: 0;
    z-index: 1000;
    backdrop-filter: blur(10px);
  }
  
  .header1 {
    width: 90%;
    height: 80px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: transparent;
  }
  
  .logo-section {
    display: flex;
    align-items: center;
    gap: 12px;
  }
  
  .logo-icon {
    font-size: 32px;
    animation: pulse 2s infinite;
  }
  
  @keyframes pulse {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.1); }
  }
  
  .logo-text {
    color: white;
    font-size: 24px;
    font-weight: 700;
    margin: 0;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    letter-spacing: 1px;
  }
  
  .header4 {
    flex: 1;
    height: 60px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0 40px;
  }
  
  .menu-list {
    display: flex;
    gap: 20px;
    align-items: center;
  }
  
  .menu-item {
    position: relative;
    font-family: 'PingFang SC', 'Microsoft YaHei', '微软雅黑', sans-serif;
    font-size: 16px;
    font-weight: 500;
    cursor: pointer;
    padding: 12px 16px;
    border-radius: 8px;
    color: rgba(255, 255, 255, 0.9);
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    overflow: hidden;
  }
  
  .menu-item:hover {
    background: rgba(255, 255, 255, 0.1);
    color: white;
    transform: translateY(-2px);
  }
  
  .menu-item.menu-active {
    background: rgba(255, 255, 255, 0.2);
    color: white;
    font-weight: 600;
  }
  
  .menu-underline {
    position: absolute;
    bottom: 0;
    left: 50%;
    width: 0;
    height: 3px;
    background: linear-gradient(90deg, #ffd89b 0%, #19547b 100%);
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    transform: translateX(-50%);
    border-radius: 2px;
  }
  
  .menu-item:hover .menu-underline,
  .menu-item.menu-active .menu-underline {
    width: 80%;
  }
  
  .header5 {
    display: flex;
    align-items: center;
    gap: 16px;
  }
  
  .user-avatar-container {
    position: relative;
    cursor: pointer;
    transition: all 0.3s ease;
  }
  
  .user-avatar-container:hover {
    transform: scale(1.1);
  }
  
  .user-avatar {
    width: 45px;
    height: 45px;
    border-radius: 50%;
    border: 3px solid rgba(255, 255, 255, 0.3);
    object-fit: cover;
    transition: all 0.3s ease;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
  }
  
  .user-avatar:hover {
    border-color: rgba(255, 255, 255, 0.8);
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
  }
  
  .avatar-badge {
    position: absolute;
    top: -2px;
    right: -2px;
    width: 12px;
    height: 12px;
    background: linear-gradient(45deg, #4CAF50, #45a049);
    border-radius: 50%;
    border: 2px solid white;
    animation: online-pulse 2s infinite;
  }
  
  @keyframes online-pulse {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.6; }
  }
  
  .logout-btn {
    display: flex;
    align-items: center;
    gap: 6px;
    padding: 10px 18px;
    border-radius: 25px;
    color: white;
    background: rgba(255, 255, 255, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.2);
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    backdrop-filter: blur(10px);
  }
  
  .logout-btn:hover {
    background: rgba(255, 255, 255, 0.2);
    border-color: rgba(255, 255, 255, 0.4);
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
  }
  
  .logout-icon {
    font-size: 16px;
    animation: wiggle 2s infinite;
  }
  
  @keyframes wiggle {
    0%, 100% { transform: rotate(0deg); }
    25% { transform: rotate(-5deg); }
    75% { transform: rotate(5deg); }
  }
  
  /* 响应式设计 */
  @media (max-width: 1200px) {
    .menu-list {
      gap: 15px;
    }
    
    .menu-item {
      font-size: 14px;
      padding: 10px 12px;
    }
  }
  
  @media (max-width: 992px) {
    .header1 {
      width: 95%;
    }
    
    .logo-text {
      font-size: 20px;
    }
    
    .menu-list {
      gap: 10px;
    }
    
    .menu-item {
      font-size: 13px;
      padding: 8px 10px;
    }
  }
</style>
