<template>
  <div class="_contact">
      <div class="search-table">
        <div class="search">
            <el-row :gutter="10" style="padding:10px">
                <el-col :xs="24" :sm="12" :md="8" :lg="8" :xl="8">
                    <span class="search-title">联系标题:</span>
                    <el-input
                        style="margin-top:10px"
                        size="mini"
                        placeholder="请输入联系标题"
                        v-model="search.title">
                    </el-input>
                </el-col>
                <el-col :xs="24" :sm="12" :md="8" :lg="8" :xl="8">
                    <el-button style="margin-top:10px" size="mini" icon="el-icon-search" type="primary" @click="searchPage">查询</el-button>
                    <el-button style="margin-top:10px" size="mini" icon="el-icon-refresh" @click="refresh">重置</el-button>
                </el-col>
            </el-row>
        </div>
        <div class="table">
            <el-row style="padding-top:10px;margin-left:10px">
                <el-button type="primary" size="mini" icon="el-icon-plus" plain @click="add">新增</el-button>
                <el-button type="success" :disabled="update.length != 1 ?true:false" size="mini" icon="el-icon-edit" plain @click="updateDataBtn">修改</el-button>
                <el-button type="danger" :disabled="update.length <= 0 ?true:false" size="mini" icon="el-icon-delete" plain @click="deleteDataBtn">删除</el-button>
            </el-row>
            <el-table
            v-loading="loading"
            :data="tableData"
            @selection-change="handleSelectionChange"
            stripe
            style="width: 100%">
            <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="title" label="联系标题"></el-table-column>
            <el-table-column prop="phone" label="联系电话"></el-table-column>
            <el-table-column prop="email" label="电子邮箱"></el-table-column>
            <el-table-column prop="address" label="地址"></el-table-column>
            <el-table-column prop="sortOrder" label="排序"></el-table-column>
            <el-table-column prop="state" label="状态">
              <template slot-scope="scope">
                  <el-tag v-if="scope.row.state == 0">禁用</el-tag>
                  <el-tag v-if="scope.row.state == 1" type="warning">启用</el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="createTime" label="创建时间"></el-table-column>
            <el-table-column label="操作" width="300">
              <template slot-scope="scope">
                <el-button size="mini" type="info" v-if="scope.row.state == 0" @click="toEdit(scope.row.id,1)">启用</el-button>
                <el-button size="mini" type="info" v-if="scope.row.state == 1" @click="toEdit(scope.row.id,0)">禁用</el-button>
                <el-button size="mini" type="success" @click="updateData(scope.row.id)">修改</el-button>
                <el-popconfirm
                  style="margin-left:5px"
                  confirm-button-text='确认'
                  cancel-button-text='取消'
                  icon="el-icon-info"
                  icon-color="red"
                  title="确认删除选中的数据？"
                  @confirm="deleteDate(scope.row.id)"
                >
                  <el-button size="mini" slot="reference" type="danger">删除</el-button>
                </el-popconfirm>
              </template>
            </el-table-column>
          </el-table>
          <el-pagination
            background
            layout="total, sizes, prev, pager, next, jumper"
            :page-sizes="[10, 20, 50, 100]"
            :page-size="search.pageSize"
            :current-page="search.pageNumber"
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :total="total">
          </el-pagination>
          </div>
        </div>
        <add @addFalse="addFalse" :addVisible = "addVisible"></add>
        <update @updateFalse="updateFalse" :updateId = "updateId" :updateVisible = "updateVisible"></update>
    </div>
  </div>
</template>

<script>
  import add from '../../../components/system/contact/addContact'
  import update from '../../../components/system/contact/updateContact'
  import {getSysContactPage,removeSysContact,editSysContact} from '../../../api/api' 
  export default {
    data() {
      return{
        loading: true,
        update: [],
        remove: [],
        updateId: "",
        addVisible: false,
        updateVisible: false,
        search: {
            title: "",
            pageNumber: 1,
            pageSize:10
        },
        total: 0,
        tableData: []
      }
    },
    components: {
      add,
      update
    },
    methods: {
      toEdit(id,state) {
        var param = {
          id: id,
          state: state
        }
        editSysContact(param).then(res => {
          if(res.code == 1000) {
            this.query()
          }
        })
      },
      searchPage() {
        this.search.pageNumber = 1
        this.query()
      },
      query() {
        getSysContactPage(this.search).then(res => {
          if(res.code == 1000) {
            this.tableData = res.data.records
            this.total = res.data.total
            this.loading = false
          }
        })
      },
      refresh() {
        this.search.title = ""
        this.query()
      },
      handleCurrentChange(val) {
        this.search.pageNumber = val
        this.query()
      },
      handleSizeChange(val) {
        this.search.pageSize = val
        this.query()
      },
      handleSelectionChange(val) {
        this.update = []
        this.remove = []
        for (let i = 0;i < val.length;i++) {
          var item = val[i]
          this.update.push(item.id)
          this.remove.push(item.id)
        }
      },
      add() {
        this.addVisible = true
      },
      addFalse() {
        this.addVisible = false
        this.query()
      },
      updateData(id) {
        this.updateId = id
        this.updateVisible = true
      },
      updateDataBtn() {
        this.updateId = this.update[0]
        this.updateVisible = true
      },
      updateFalse() {
        this.updateVisible = false
        this.query()
      },
      deleteDate(id) {
        removeSysContact({ids:id}).then(res => {
          if(res.code == 1000) {
            this.$notify({
              title: '成功',
              message: '删除成功',
              type: 'success'
            });
            this.query()
          } else {
            this.$notify.error({
              title: '错误',
              message: res.message
            });
          }
        })
      },
      deleteDataBtn() {
        this.$confirm('此操作将永久删除该数据, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          var ids = this.remove.join(",")
          removeSysContact({ids:ids}).then(res => {
            if(res.code == 1000) {
              this.$notify({
                title: '成功',
                message: '删除成功',
                type: 'success'
              });
              this.query()
            } else {
              this.$notify.error({
                title: '错误',
                message: res.message
              });
            }
          })
        }).catch(() => {
          this.$notify({
            type: 'info',
            message: '已取消删除'
          });          
        });
      }
    },
    mounted() {
      this.query()
    }
  }
</script> 