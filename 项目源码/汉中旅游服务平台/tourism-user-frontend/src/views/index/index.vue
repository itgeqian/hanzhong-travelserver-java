<template>
  <div class="index">
    <headers></headers>
    
    <!-- 轮播图区域 -->
    <div class="carousel-container">
      <el-carousel height="500px" class="main-carousel">
        <el-carousel-item v-for="(item,index) in rotations" :key="index">
          <div class="carousel-image-wrapper">
            <img
                class="carousel-image"
                :src="$store.state.HOST + item.image"
                :alt="'轮播图' + (index + 1)"
            >
            <div class="carousel-overlay">
              <h3 class="carousel-title">探索汉中之美</h3>
              <p class="carousel-subtitle">发现历史文化与自然风光的完美融合</p>
            </div>
          </div>
        </el-carousel-item>
      </el-carousel>
    </div>
    
    <!-- 推荐景点区域 -->
    <div class="index1">
      <div class="index2">
        <div class="index3">
          🏛️ 推荐景点 🏛️
        </div>
        <div class="index4">
          <div class="index5 card-hover" v-for="(item,index) in attractions" :key="index">
            <div class="image-container">
              <img :src="item.images.split(',')[0]" :alt="item.name">
              <div class="image-overlay">
                <span class="view-details">查看详情</span>
              </div>
            </div>
            <div class="index6">
              <div class="index7">{{item.name}}</div>
              <div class="index8">{{item.introduce}}</div>
              <div class="card-footer">
                <div class="price-tag" v-if="item.price">
                  ¥{{item.price}}
                </div>
                <div class="index9" @click="toInfo(item.id)">
                  <span>预 约</span>
                  <i class="btn-arrow">→</i>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="button-container">
          <el-button size="medium" type="primary" plain @click="toAttraction" class="view-more-btn">
            查看更多景点 ✨
          </el-button>
        </div>
      </div>
    </div>
    
    <!-- 分隔区域 -->
    <div class="index10">
      <div class="parallax-content">
        <h2 class="parallax-title">汉中</h2>
        <p class="parallax-subtitle">千年古城，人文荟萃</p>
        <div class="floating-elements">
          <div class="floating-element" style="animation-delay: 0s;">🏮</div>
          <div class="floating-element" style="animation-delay: 1s;">🌸</div>
          <div class="floating-element" style="animation-delay: 2s;">🦋</div>
        </div>
      </div>
    </div>
    
    <!-- 统计数据 -->
    <div class="index11">
      <div class="stats-container">
        <div class="stats-icon">📊</div>
        <div class="stats-text">
          全年总接待游客量：<span class="stats-number">{{count}}</span>
        </div>
        <div class="stats-subtitle">万人次</div>
      </div>
    </div>
    
    <!-- 旅游路线区域 -->
    <div class="index1">
      <div class="index2">
        <div class="index3">
          🗺️ 旅游路线 🗺️
        </div>
        <div class="index4">
          <div class="index5 card-hover" v-for="(item,index) in line" :key="index">
            <div class="image-container">
              <img :src="item.images.split(',')[0]" :alt="item.name">
              <div class="image-overlay">
                <span class="view-details">查看路线</span>
              </div>
            </div>
            <div class="index6">
              <div class="index7">{{item.name}}</div>
              <div class="index8">{{item.introduce}}</div>
              <div class="card-footer">
                <div class="route-badge">精品路线</div>
                <div class="index9" @click="toLineInfo(item.id)">
                  <span>查 看</span>
                  <i class="btn-arrow">→</i>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="button-container">
          <el-button size="medium" type="primary" plain @click="toLine" class="view-more-btn">
            查看更多路线 🚗
          </el-button>
        </div>
      </div>
    </div>
    
    <bottoms></bottoms>
  </div>
</template>

<script>
  import {getSysRotationsList,getSysAttractionsIndex,getUserCount,getSysLineIndex} from '../../api/api'
  import headers from '@/components/header'
  import bottoms from '@/components/bottom'
  export default {
    data() {
      return{
        rotations: [],
        attractions: [],
        count: 0,
        line: [],
      }
    },
    components: {
      headers,
      bottoms
    },
    methods: {
      toAttraction() {
        this.$router.push("/attractions")
      },
      toLine() {
        this.$router.push("/line")
      },
      toInfo(id) {
        this.$router.push("/attractionsInfo?id=" + id)
      },
      toLineInfo(id) {
        this.$router.push("/lineInfo?id=" + id)
      },
      getSysRotationsList() {
        getSysRotationsList().then(res => {
          if (res.code == 1000) {
            this.rotations = res.data
          }
        })
      },
      getSysAttractionsIndex() {
        getSysAttractionsIndex().then(res => {
          if (res.code == 1000) {
            this.attractions = res.data
          }
        })
      },
      getUserCount() {
        getUserCount().then(res => {
          if (res.code == 1000) {
            this.count = res.data
          }
        })
      },
      getSysLineIndex() {
        getSysLineIndex().then(res => {
          if (res.code == 1000) {
            this.line = res.data
          }
        })
      }
    },
    created() {
     
    },
    mounted() {
      this.getSysRotationsList()
      this.getSysAttractionsIndex()
      this.getUserCount()
      this.getSysLineIndex()
    }
 }
</script>

<style scoped>
   @import url('../../assets/css/index.css');
   
   /* 轮播图样式 */
   .carousel-container {
     display: flex;
     justify-content: center;
     padding: 30px 0;
   }
   
   .main-carousel {
     width: 90%;
     max-width: 1200px;
   }
   
   .carousel-image-wrapper {
     position: relative;
     height: 100%;
     overflow: hidden;
   }
   
   .carousel-image {
     width: 100%;
     height: 100%;
     object-fit: cover;
     transition: transform 0.5s ease;
   }
   
   .carousel-overlay {
     position: absolute;
     bottom: 0;
     left: 0;
     right: 0;
     background: linear-gradient(transparent, rgba(0,0,0,0.7));
     color: white;
     padding: 40px;
     text-align: center;
     transform: translateY(100%);
     transition: transform 0.3s ease;
   }
   
   .carousel-image-wrapper:hover .carousel-overlay {
     transform: translateY(0);
   }
   
   .carousel-title {
     font-size: 28px;
     font-weight: 700;
     margin-bottom: 10px;
   }
   
   .carousel-subtitle {
     font-size: 16px;
     opacity: 0.9;
   }
   
   /* 图片容器样式 */
   .image-container {
     position: relative;
     overflow: hidden;
     height: 250px;
     border-radius: 20px 20px 0 0;
   }
   
   .image-overlay {
     position: absolute;
     top: 0;
     left: 0;
     right: 0;
     bottom: 0;
     background: rgba(0,0,0,0.5);
     display: flex;
     align-items: center;
     justify-content: center;
     opacity: 0;
     transition: opacity 0.3s ease;
   }
   
   .index5:hover .image-overlay {
     opacity: 1;
   }
   
   .view-details {
     color: white;
     font-size: 16px;
     font-weight: 600;
     padding: 12px 24px;
     border: 2px solid white;
     border-radius: 25px;
     transition: all 0.3s ease;
   }
   
   .view-details:hover {
     background: white;
     color: #333;
   }
   
   /* 卡片底部样式 */
   .card-footer {
     display: flex;
     justify-content: space-between;
     align-items: center;
     margin-top: 16px;
   }
   
   .price-tag {
     background: linear-gradient(135deg, #ff6b6b, #ee5a24);
     color: white;
     padding: 6px 12px;
     border-radius: 15px;
     font-size: 14px;
     font-weight: 600;
   }
   
   .route-badge {
     background: linear-gradient(135deg, #26de81, #20bf6b);
     color: white;
     padding: 6px 12px;
     border-radius: 15px;
     font-size: 12px;
     font-weight: 600;
   }
   
   .btn-arrow {
     margin-left: 6px;
     transition: transform 0.3s ease;
   }
   
   .index9:hover .btn-arrow {
     transform: translateX(3px);
   }
   
   /* 按钮容器 */
   .button-container {
     display: flex;
     justify-content: center;
     margin-top: 40px;
   }
   
   .view-more-btn {
     font-size: 16px;
     padding: 15px 40px;
     border-radius: 30px;
   }
   
   /* 视差区域内容 */
   .parallax-content {
     text-align: center;
     color: white;
     position: relative;
     z-index: 2;
   }
   
   .parallax-title {
     font-size: 60px;
     font-weight: 900;
     margin-bottom: 20px;
     text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
   }
   
   .parallax-subtitle {
     font-size: 24px;
     opacity: 0.9;
     letter-spacing: 2px;
   }
   
   .floating-elements {
     position: absolute;
     top: 0;
     left: 0;
     right: 0;
     bottom: 0;
     pointer-events: none;
   }
   
   .floating-element {
     position: absolute;
     font-size: 24px;
     animation: float 3s ease-in-out infinite;
   }
   
   .floating-element:nth-child(1) { top: 20%; left: 20%; }
   .floating-element:nth-child(2) { top: 60%; right: 20%; }
   .floating-element:nth-child(3) { bottom: 20%; left: 50%; }
   
   @keyframes float {
     0%, 100% { transform: translateY(0px); }
     50% { transform: translateY(-20px); }
   }
   
   /* 统计数据样式 */
   .stats-container {
     display: flex;
     flex-direction: column;
     align-items: center;
     gap: 15px;
   }
   
   .stats-icon {
     font-size: 48px;
     animation: bounce 2s infinite;
   }
   
   @keyframes bounce {
     0%, 100% { transform: translateY(0); }
     50% { transform: translateY(-10px); }
   }
   
   .stats-text {
     font-size: inherit;
   }
   
   .stats-number {
     font-weight: 900;
     font-size: 1.2em;
     background: linear-gradient(45deg, #667eea, #764ba2);
     -webkit-background-clip: text;
     -webkit-text-fill-color: transparent;
     background-clip: text;
   }
   
   .stats-subtitle {
     font-size: 18px;
     opacity: 0.8;
     font-weight: 500;
   }
</style>