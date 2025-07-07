<template>
  <div class="foodInfo">
    <headers></headers>
    <div class="foodInfo1">
        <div class="foodInfo2">
            <div class="foodInfo3">
                <el-carousel height="500px" v-if="info.images">
                    <el-carousel-item v-for="(item,index) in info.images.split(',')" :key="index">
                        <img style="width:100%;height:100%" :src="$store.state.HOST + item">
                    </el-carousel-item>
                </el-carousel>
                <div v-else style="width:100%;height:500px;display:flex;align-items:center;justify-content:center;background:#f5f5f5;">
                    <span style="color:#999;">暂无图片</span>
                </div>
            </div>
            <div class="foodInfo4">
                <div class="foodInfo5">{{info.name}}</div>
                <div class="foodInfo5">价格：￥{{info.price}}</div>
                <div style="margin-left:20px;margin-top:10px">美食类型：{{info.foodType}}</div>
                <div style="margin-left:20px;margin-top:10px">推荐餐厅：{{info.restaurant}}</div>
                <div style="margin-left:20px;margin-top:10px">营业时间：{{info.businessHours}}</div>
                <div style="margin-left:20px;margin-top:10px">推荐指数：
                  <el-rate v-model="info.recommendLevel" disabled show-score text-color="#ff9900"></el-rate>
                </div>
                <div class="foodInfo6">{{info.introduce}}</div>
                <div class="foodInfo7" style="margin-left:15px">
                    <!-- 收藏功能暂未实现，后期再开发 -->
                    <!-- <el-button size="small" type="primary" plain @click="addToFavor">收藏美食</el-button> -->
                </div>
            </div>
        </div>
    </div>
    <div class="foodInfo1">
        <div class="foodInfo8" >
            <div style="margin-left:20px;margin-right:20px;margin-top:20px;margin-bottom:20px">
                详细介绍：{{info.content}}
            </div>
        </div>
    </div>
    <div class="foodInfo1">
        <div class="foodInfo8">
            <el-input style="margin-top:20px" v-model="content" type="textarea" rows="7" placeholder="请输入评论内容"></el-input>
           <el-rate v-model="score"></el-rate>
            <el-button style="margin-top:20px" type="primary" size="small" plain @click="saveSysComments">评论</el-button>
            <div class="forum1" style="width:100%">
                <div class="forum2" style="padding:0" v-for="(item,index) in tableData" :key="index">
                    <img style="border-radius:50%;width:40px;height:40px;margin-left:20px" :src="$store.state.HOST + item.avatar">
                    <div style="margin-left:10px">
                        {{item.createBy}}
                    </div>
                    <div style="margin-left:20px">
                        {{item.content}}
                    </div>
                </div>
            </div>
            <el-pagination
                background
                :page-size="search.pageSize"
                layout="prev, pager, next"
                @current-change="handleCurrentChange"
                :total="total">
            </el-pagination>
        </div>
    </div>
    <bottoms></bottoms>
  </div>
</template>

<script>
  import {getSysFoodById,getSysCommentsPage,saveSysComments} from '../../api/api'
  // import {saveSysFavor} from '../../api/api' // 收藏功能暂未实现
  import headers from '@/components/header'
  import bottoms from '@/components/bottom'
  export default {
    data() {
      return{
        id: "",
        search: {
          foodId: "",
          pageSize: 10,
          pageNumber: 1,
        },
        info: {},
        total:0,
        tableData: [],
        content: "",
        score: null,
        userId: null,
      }
    },
    components: {
      headers,
      bottoms
    },
    methods: {
      saveSysComments() {
          if (!this.content) {
            this.$message({
                message: '请输入评论内容',
                type: 'warning'
            });
            return
          }
          var param = {
              content: this.content,
              score:this.score,
              foodId: this.id,
              userId:this.userId
          }
          saveSysComments(param).then(res => {
              if (res.code == 1000) {
                this.$message({
                    message: '评论成功',
                    type: 'success'
                });
                this.content = ""
                this.getSysCommentsPage()
              }
          })
      },
      getSysCommentsPage() {
          this.search.foodId = this.id
          getSysCommentsPage(this.search).then(res => {
            if (res.code == 1000) {
                this.tableData = res.data.records
                this.total = res.data.total
            }
          })
      },
      /* 收藏功能暂未实现，后期再开发
      addToFavor() {
          if (!this.userId) {
            this.$message({
                message: '请先登录',
                type: 'warning'
            });
            return
          }
          var param = {
              type: 'food',
              targetId: this.id,
              userId: this.userId
          }
          saveSysFavor(param).then(res => {
              if (res.code == 1000) {
                this.$message({
                    message: '收藏成功',
                    type: 'success'
                });
              } else {
                this.$message({
                    message: res.message,
                    type: 'warning'
                });
              }
          })
      },
      */
      getSysFoodById() {
          getSysFoodById({id:this.id}).then(res => {
            if (res.code == 1000) {
                this.info = res.data
            }
          })
      },
      handleCurrentChange(val) {
        this.search.pageNumber = val
        this.getSysCommentsPage()
      }, 
    },
    created() {
      this.id = this.$route.query.id
      // 从localStorage获取用户信息
      const userInfo = window.localStorage.getItem("user_info")
      if(userInfo) {
        try {
          const userData = JSON.parse(userInfo)
          this.userId = userData.id
          console.log('用户ID:', this.userId)
        } catch (e) {
          console.log('解析用户信息失败:', e)
          this.userId = null
        }
      } else {
        console.log('未找到用户信息')
        this.userId = null
      }
    },
    mounted() {
      this.getSysFoodById()
      this.getSysCommentsPage()
    }
 }
</script>

<style scoped>
   @import url('../../assets/css/food.css');
</style> 