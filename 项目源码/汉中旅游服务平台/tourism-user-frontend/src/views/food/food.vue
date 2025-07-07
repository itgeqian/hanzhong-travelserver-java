<template>
  <div class="food">
    <headers></headers>
    <div class="food1">
      <div class="food2">
        <el-input size="small" style="width:300px;margin-left:20px" v-model="search.name" placeholder="请输入美食名称"></el-input>
        <el-select size="small" style="width:200px;margin-left:20px" v-model="search.foodType" placeholder="请选择美食类型">
          <el-option label="全部" value=""></el-option>
          <el-option label="川菜" value="川菜"></el-option>
          <el-option label="湘菜" value="湘菜"></el-option>
          <el-option label="粤菜" value="粤菜"></el-option>
          <el-option label="鲁菜" value="鲁菜"></el-option>
          <el-option label="苏菜" value="苏菜"></el-option>
          <el-option label="浙菜" value="浙菜"></el-option>
          <el-option label="闽菜" value="闽菜"></el-option>
          <el-option label="徽菜" value="徽菜"></el-option>
          <el-option label="小吃" value="小吃"></el-option>
          <el-option label="甜品" value="甜品"></el-option>
          <el-option label="其他" value="其他"></el-option>
        </el-select>
        <el-button size="small" style="margin-left:20px" type="primary" plain @click="searchPage">搜索</el-button>
      </div>
      <div class="food3">
        <div class="index5" v-for="(item,index) in tableData" :key="index" style="margin-top:15px">
          <img 
            style="width:100%;height:280px;object-fit:cover;" 
            :src="getImageUrl(item.images)"
            @error="handleImageError($event)"
            :alt="item.name">
          <div class="index6">
            <div class="index7">{{item.name}}</div>
            <div class="index8">{{item.introduce}}</div>
            <div class="index8">人均：{{item.price || '暂无'}}元</div>
            <div class="food-rate">
              <el-rate :value="item.recommendLevel" disabled text-color="#ff9900"></el-rate>
              <span style="color: #999;">{{item.recommendLevel || 0}} 分</span>
            </div>
            <div class="index9" @click="toInfo(item.id)" style="margin-bottom:30px;cursor: pointer;">
              查 看 详 情
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
  import {getSysFoodPage} from '../../api/api'
  import headers from '@/components/header'
  import bottoms from '@/components/bottom'
  export default {
    data() {
      return{
        search: {
          name: "",
          foodType: "",
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
        // 返回默认的占位图片（灰色背景，图片图标）
        return 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAwIiBoZWlnaHQ9IjMwMCIgdmlld0JveD0iMCAwIDMwMCAzMDAiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHJlY3Qgd2lkdGg9IjMwMCIgaGVpZ2h0PSIzMDAiIGZpbGw9IiNGNUY1RjUiLz48cGF0aCBkPSJNMTUwIDEwMEM4OC4zODczIDEwMCA0MCA5NS41IDQwIDkwQzQwIDg0LjUgODguMzg3MyA4MCA1MCA4MEgyNTBDMjExLjYxMyA4MCAyNjAgODQuNSAyNjAgOTBDMjYwIDk1LjUgMjExLjYxMyAxMDAgMTUwIDEwMFoiIGZpbGw9IiNDN0M3QzciLz48dGV4dCB4PSIxNTAiIHk9IjE3MCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0iIzk5OTk5OSIgZm9udC1mYW1pbHk9IkFyaWFsLCBzYW5zLXNlcmlmIiBmb250LXNpemU9IjE2Ij7pgJrmoYg8L3RleHQ+PC9zdmc+';
      },
      handleImageError(event) {
        console.log('图片加载失败:', event.target.src);
        event.target.src = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAwIiBoZWlnaHQ9IjMwMCIgdmlld0JveD0iMCAwIDMwMCAzMDAiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHJlY3Qgd2lkdGg9IjMwMCIgaGVpZ2h0PSIzMDAiIGZpbGw9IiNGNUY1RjUiLz48cGF0aCBkPSJNMTUwIDEwMEM4OC4zODczIDEwMCA0MCA5NS41IDQwIDkwQzQwIDg0LjUgODguMzg3MyA4MCA1MCA4MEgyNTBDMjExLjYxMyA4MCAyNjAgODQuNSAyNjAgOTBDMjYwIDk1LjUgMjExLjYxMyAxMDAgMTUwIDEwMFoiIGZpbGw9IiNDN0M3QzciLz48dGV4dCB4PSIxNTAiIHk9IjE3MCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0iIzk5OTk5OSIgZm9udC1mYW1pbHk9IkFyaWFsLCBzYW5zLXNlcmlmIiBmb250LXNpemU9IjE2Ij7lm77niYfliqDovb3lpLHotKU8L3RleHQ+PC9zdmc+';
      },
      searchPage() {
        this.search.pageNumber = 1
        this.getSysFoodPage()
      },
      getSysFoodPage() {
        getSysFoodPage(this.search).then(res => {
          console.log('美食推荐API响应:', res)
          if (res.code == 1000) {
            // 处理数据，确保recommendLevel是数字类型
            this.tableData = res.data.records.map(item => ({
              ...item,
              recommendLevel: item.recommendLevel ? Number(item.recommendLevel) : 0,
              price: item.price ? Number(item.price) : 0
            }))
            this.total = res.data.total
            console.log('美食推荐数据:', this.tableData)
            // 调试数据字段
            if (this.tableData.length > 0) {
              console.log('第一个美食项目的完整数据:', this.tableData[0])
              console.log('价格字段 - price:', this.tableData[0].price)
              console.log('评分字段 - recommendLevel:', this.tableData[0].recommendLevel)
              console.log('图片路径:', this.tableData[0].images)
              if (this.tableData[0].images) {
                console.log('完整图片URL:', this.$store.state.HOST + this.tableData[0].images.split(',')[0])
              }
            }
          } else {
            console.error('美食推荐API错误:', res.message)
            this.$message.error(res.message || '获取美食推荐数据失败')
          }
        }).catch(err => {
          console.error('美食推荐API请求失败:', err)
          this.$message.error('网络请求失败')
        })
      },
      toInfo(id) {
        this.$router.push("/foodInfo?id=" + id)
      },
      handleCurrentChange(val) {
        this.search.pageNumber = val
        this.getSysFoodPage()
      }, 
    },
    created() {
     
    },
    mounted() {
      this.getSysFoodPage()
    }
 }
</script>

<style scoped>
   @import url('../../assets/css/food.css');
</style> 