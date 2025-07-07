<template>
  <div class="culture">
    <headers></headers>
    <div class="culture1">
      <div class="culture2">
        <el-input size="small" style="width:300px;margin-left:20px" v-model="search.name" placeholder="请输入活动名称"></el-input>
        <el-select size="small" style="width:200px;margin-left:20px" v-model="search.cultureType" placeholder="请选择活动类型">
          <el-option label="全部" value=""></el-option>
          <el-option label="传统节日" value="传统节日"></el-option>
          <el-option label="书法艺术" value="书法艺术"></el-option>
          <el-option label="国画体验" value="国画体验"></el-option>
          <el-option label="茶艺文化" value="茶艺文化"></el-option>
          <el-option label="武术表演" value="武术表演"></el-option>
          <el-option label="古典音乐" value="古典音乐"></el-option>
          <el-option label="传统戏剧" value="传统戏剧"></el-option>
          <el-option label="民俗活动" value="民俗活动"></el-option>
          <el-option label="手工艺制作" value="手工艺制作"></el-option>
          <el-option label="其他" value="其他"></el-option>
        </el-select>
        <el-button size="small" style="margin-left:20px" type="primary" plain @click="searchPage">搜索</el-button>
      </div>
      <div class="culture3">
        <div class="index5" v-for="(item,index) in tableData" :key="index" style="margin-top:15px">
          <img 
            style="width:100%;height:280px;object-fit:cover;" 
            :src="getImageUrl(item.images)"
            @error="handleImageError($event)"
            :alt="item.name">
          <div class="index6">
            <div class="index7">{{item.name}}</div>
            <div class="index8">活动时间：{{item.activityTime}}</div>
            <div class="index8">活动地点：{{item.location}}</div>
            <div class="index8">{{item.introduce}}</div>
            <div class="index9" @click="toInfo(item.id)" style="margin-bottom:30px;cursor: pointer;">
              预 约 参 加
            </div>
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
    <bottoms></bottoms>
  </div>
</template>

<script>
  import {getSysCulturePage} from '../../api/api'
  import headers from '@/components/header'
  import bottoms from '@/components/bottom'
  export default {
    data() {
      return{
        search: {
          name: "",
          cultureType: "",
          state: 1,
          pageSize: 12,
          pageNumber: 1,
        },
        total:0,
        tableData: [],
      }
    },
    components: {
      headers,
      bottoms
    },
    methods: {
      getImageUrl(images) {
        if (images && images.trim() !== '') {
          const imageUrl = this.$store.state.HOST + images.split(',')[0];
          console.log('生成的图片URL:', imageUrl);
          return imageUrl;
        }
        // 返回默认的占位图片
        return 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAwIiBoZWlnaHQ9IjMwMCIgdmlld0JveD0iMCAwIDMwMCAzMDAiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHJlY3Qgd2lkdGg9IjMwMCIgaGVpZ2h0PSIzMDAiIGZpbGw9IiNGNUY1RjUiLz48cGF0aCBkPSJNMTUwIDEwMEM4OC4zODczIDEwMCA0MCA5NS41IDQwIDkwQzQwIDg0LjUgODguMzg3MyA4MCA1MCA4MEgyNTBDMjExLjYxMyA4MCAyNjAgODQuNSAyNjAgOTBDMjYwIDk1LjUgMjExLjYxMyAxMDAgMTUwIDEwMFoiIGZpbGw9IiNDN0M3QzciLz48dGV4dCB4PSIxNTAiIHk9IjE3MCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0iIzk5OTk5OSIgZm9udC1mYW1pbHk9IkFyaWFsLCBzYW5zLXNlcmlmIiBmb250LXNpemU9IjE2Ij7pgJrmoYg8L3RleHQ+PC9zdmc+';
      },
      handleImageError(event) {
        console.log('图片加载失败:', event.target.src);
        event.target.src = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAwIiBoZWlnaHQ9IjMwMCIgdmlld0JveD0iMCAwIDMwMCAzMDAiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHJlY3Qgd2lkdGg9IjMwMCIgaGVpZ2h0PSIzMDAiIGZpbGw9IiNGNUY1RjUiLz48cGF0aCBkPSJNMTUwIDEwMEM4OC4zODczIDEwMCA0MCA5NS41IDQwIDkwQzQwIDg0LjUgODguMzg3MyA4MCA1MCA4MEgyNTBDMjExLjYxMyA4MCAyNjAgODQuNSAyNjAgOTBDMjYwIDk1LjUgMjExLjYxMyAxMDAgMTUwIDEwMFoiIGZpbGw9IiNDN0M3QzciLz48dGV4dCB4PSIxNTAiIHk9IjE3MCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0iIzk5OTk5OSIgZm9udC1mYW1pbHk9IkFyaWFsLCBzYW5zLXNlcmlmIiBmb250LXNpemU9IjE2Ij7lm77niYfliqDovb3lpLHotKU8L3RleHQ+PC9zdmc+';
      },
      searchPage() {
        this.search.pageNumber = 1
        this.getSysCulturePage()
      },
      getSysCulturePage() {
        getSysCulturePage(this.search).then(res => {
          console.log('汉文化活动API响应:', res)
          if (res.code == 1000) {
            this.tableData = res.data.records
            this.total = res.data.total
            console.log('汉文化活动数据:', this.tableData)
          } else {
            console.error('汉文化活动API错误:', res.message)
            this.$message.error(res.message || '获取汉文化活动数据失败')
          }
        }).catch(err => {
          console.error('汉文化活动API请求失败:', err)
          this.$message.error('网络请求失败')
        })
      },
      toInfo(id) {
        this.$router.push("/cultureInfo?id=" + id)
      },
      handleCurrentChange(val) {
        this.search.pageNumber = val
        this.getSysCulturePage()
      }, 
    },
    created() {
     
    },
    mounted() {
      this.getSysCulturePage()
    }
 }
</script>

<style scoped>
   @import url('../../assets/css/culture.css');
</style> 