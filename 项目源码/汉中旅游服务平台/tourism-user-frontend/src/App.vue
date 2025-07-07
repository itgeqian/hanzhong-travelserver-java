<template>
  <div id="app">
    <router-view/>
    
    <!-- 回到顶部按钮 -->
    <transition name="back-to-top-fade">
      <div 
        v-show="showBackToTop" 
        class="back-to-top"
        @click="scrollToTop"
        title="回到顶部"
      >
        <i class="el-icon-top"></i>
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      showBackToTop: false
    }
  },
  mounted() {
    // 监听滚动事件
    window.addEventListener('scroll', this.handleScroll)
  },
  beforeDestroy() {
    // 移除滚动事件监听
    window.removeEventListener('scroll', this.handleScroll)
  },
  methods: {
    // 处理滚动事件
    handleScroll() {
      this.showBackToTop = window.pageYOffset > 300
    },
    
    // 回到顶部
    scrollToTop() {
      // 平滑滚动到顶部
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      })
    }
  }
}
</script>

<style>
  html,body,#app,.common-layout{
    margin: 0;
    padding: 0;
    height:100%;
    font-family: 'PingFang SC', 'Microsoft YaHei', '微软雅黑', sans-serif;
  }
  
  /* 全局动画 */
  * {
    transition: all 0.3s ease;
  }
  
  .xiaoshi {
    display: none;
  }
  
  body::-webkit-scrollbar {
      width: 0px;
      height: 0px;
  }
  
  /* 美化滚动条 */
  ::-webkit-scrollbar {
    width: 10px;
    height: 10px;
  }
  
  ::-webkit-scrollbar-track {
    background: linear-gradient(45deg, #f1f1f1, #e8e8e8);
    border-radius: 10px;
  }
  
  ::-webkit-scrollbar-thumb {
    background: linear-gradient(45deg, #667eea, #764ba2);
    border-radius: 10px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.2);
  }
  
  ::-webkit-scrollbar-thumb:hover {
    background: linear-gradient(45deg, #764ba2, #667eea);
    transform: scale(1.1);
  }
  
  /* 分页样式优化 */
  .el-pagination {
    padding-bottom:20px!important;
    padding-top:20px!important;
    display:flex;
    justify-content: center;
  }
  
  /* 对话框样式优化 */
  .el-dialog__wrapper {
    .el-dialog {
      border-radius: 15px;
      box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
      background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
    }
  }
  
  .el-dialog__title {
    font-size: 16px !important;
    font-family: 'PingFang SC', 'Microsoft YaHei', '微软雅黑', sans-serif;
    font-weight: 600;
    color: #2c3e50;
  }
  
  .el-dialog__header {
    border-bottom: 1px solid #e8ecf0;
    background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
    border-radius: 15px 15px 0 0;
    padding: 20px;
  }
  
  .el-dialog__header .el-dialog__title {
    color: white;
  }
  
  /* 按钮悬停效果 */
  .el-button {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  }
  
  .el-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
  }
  
  /* 输入框样式优化 */
  .el-input__inner {
    border-radius: 8px;
    border: 2px solid #e8ecf0;
    transition: all 0.3s ease;
  }
  
  .el-input__inner:focus {
    border-color: #667eea;
    box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
  }
  
  /* 卡片悬停效果 */
  .card-hover {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  }
  
  .card-hover:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
  }
  
  /* 淡入动画 */
  .fade-enter-active, .fade-leave-active {
    transition: opacity 0.5s ease;
  }
  
  .fade-enter, .fade-leave-to {
    opacity: 0;
  }
  
  /* 页面切换动画 */
  .page-enter-active, .page-leave-active {
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
  }
  
  .page-enter {
    opacity: 0;
    transform: translateX(30px);
  }
  
  .page-leave-to {
    opacity: 0;
    transform: translateX(-30px);
  }
  
  /* 回到顶部按钮样式 */
  .back-to-top {
    position: fixed;
    bottom: 50px;
    right: 50px;
    width: 50px;
    height: 50px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    box-shadow: 0 4px 20px rgba(102, 126, 234, 0.3);
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    z-index: 1000;
    border: 2px solid rgba(255, 255, 255, 0.2);
  }
  
  .back-to-top:hover {
    transform: translateY(-3px) scale(1.1);
    box-shadow: 0 8px 30px rgba(102, 126, 234, 0.4);
    background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
  }
  
  .back-to-top:active {
    transform: translateY(-1px) scale(1.05);
  }
  
  .back-to-top i {
    font-size: 24px;
    color: white;
    font-weight: bold;
  }
  
  /* 回到顶部按钮动画 */
  .back-to-top-fade-enter-active, .back-to-top-fade-leave-active {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  }
  
  .back-to-top-fade-enter, .back-to-top-fade-leave-to {
    opacity: 0;
    transform: translateY(20px) scale(0.8);
  }
  
  /* 移动端适配 */
  @media (max-width: 768px) {
    .back-to-top {
      bottom: 30px;
      right: 30px;
      width: 45px;
      height: 45px;
    }
    
    .back-to-top i {
      font-size: 20px;
    }
  }
  
  /* 超小屏幕适配 */
  @media (max-width: 480px) {
    .back-to-top {
      bottom: 20px;
      right: 20px;
      width: 40px;
      height: 40px;
    }
    
    .back-to-top i {
      font-size: 18px;
    }
  }
</style>
