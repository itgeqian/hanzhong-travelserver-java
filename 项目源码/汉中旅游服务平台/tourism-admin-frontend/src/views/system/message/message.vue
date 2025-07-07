<template>
  <div class="page-container">
    <div class="page-header">
      <h2>用户留言管理</h2>
    </div>
    <div class="page-content">
        <div class="search">
            <el-row :gutter="10">
                <el-col :xs="24" :sm="12" :md="8" :lg="8" :xl="8">
                    <el-input
                        placeholder="请输入留言人姓名"
                        size="small"
                        style="margin-top:10px"
                        v-model="search.name">
                    </el-input>
                </el-col>
                <el-col :xs="24" :sm="12" :md="8" :lg="8" :xl="8">
                    <el-select
                        size="small"
                        style="margin-top:10px;width:100%"
                        placeholder="请选择处理状态"
                        v-model="search.status">
                        <el-option label="全部" value=""></el-option>
                        <el-option label="未处理" :value="0"></el-option>
                        <el-option label="已处理" :value="1"></el-option>
                    </el-select>
                </el-col>
                <el-col :xs="24" :sm="12" :md="8" :lg="8" :xl="8">
                    <el-button style="margin-top:10px" size="mini" icon="el-icon-search" type="primary" @click="searchPage">查询</el-button>
                    <el-button style="margin-top:10px" size="mini" icon="el-icon-refresh" @click="refresh">重置</el-button>
                </el-col>
            </el-row>
        </div>
        <div class="table">
            <el-row style="padding-top:10px;margin-left:10px">
                <el-button type="danger" :disabled="remove.length <= 0 ?true:false" size="mini" icon="el-icon-delete" plain @click="deleteDataBtn">删除</el-button>
            </el-row>
            <el-table
            v-loading="loading"
            :data="tableData"
            @selection-change="handleSelectionChange"
            stripe
            style="width: 100%">
            <el-table-column
              type="selection"
              width="55">
            </el-table-column>
            <el-table-column
              prop="name"
              label="留言人"
              width="100">
            </el-table-column>
            <el-table-column
              prop="phone"
              label="联系电话"
              width="120">
            </el-table-column>
            <el-table-column
              prop="email"
              label="邮箱地址"
              width="150">
            </el-table-column>
            <el-table-column
              prop="subject"
              label="留言主题"
              width="200">
            </el-table-column>
            <el-table-column
              prop="message"
              label="留言内容"
              show-overflow-tooltip>
            </el-table-column>
            <el-table-column
              prop="status"
              label="处理状态"
              width="100">
              <template slot-scope="scope">
                  <el-tag v-if="scope.row.status == 0" type="warning">未处理</el-tag>
                  <el-tag v-if="scope.row.status == 1" type="success">已处理</el-tag>
              </template>
            </el-table-column>
            <el-table-column
              prop="createTime"
              label="留言时间"
              width="150">
            </el-table-column>
            <el-table-column
              label="操作"
              width="200">
              <template slot-scope="scope">
                <el-button size="mini" type="primary" @click="handleMessage(scope.row.id)">处理</el-button>
                <el-button size="mini" type="info" @click="viewMessage(scope.row)">查看</el-button>
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
        
        <!-- 处理留言对话框 -->
        <el-dialog title="处理留言" :visible.sync="handleVisible" width="60%">
          <el-form :model="handleForm" label-width="100px">
            <el-form-item label="留言人：">
              <span>{{handleForm.name}}</span>
            </el-form-item>
            <el-form-item label="联系电话：">
              <span>{{handleForm.phone}}</span>
            </el-form-item>
            <el-form-item label="留言主题：">
              <span>{{handleForm.subject}}</span>
            </el-form-item>
            <el-form-item label="留言内容：">
              <div style="padding:10px;background:#f5f5f5;border-radius:4px;">
                {{handleForm.message}}
              </div>
            </el-form-item>
            <el-form-item label="管理员回复：">
              <el-input type="textarea" :rows="4" v-model="handleForm.reply" placeholder="请输入回复内容"></el-input>
            </el-form-item>
          </el-form>
          <span slot="footer" class="dialog-footer">
            <el-button @click="handleVisible = false">取 消</el-button>
            <el-button type="primary" @click="saveHandle">确 定</el-button>
          </span>
        </el-dialog>
        
        <!-- 查看留言对话框 -->
        <el-dialog title="留言详情" :visible.sync="viewVisible" width="60%">
          <el-descriptions :column="2" border>
            <el-descriptions-item label="留言人">{{viewForm.name}}</el-descriptions-item>
            <el-descriptions-item label="联系电话">{{viewForm.phone}}</el-descriptions-item>
            <el-descriptions-item label="邮箱地址">{{viewForm.email}}</el-descriptions-item>
            <el-descriptions-item label="留言时间">{{viewForm.createTime}}</el-descriptions-item>
            <el-descriptions-item label="留言主题" :span="2">{{viewForm.subject}}</el-descriptions-item>
            <el-descriptions-item label="留言内容" :span="2">
              <div style="padding:10px;background:#f9f9f9;border-radius:4px;white-space:pre-wrap;">
                {{viewForm.message}}
              </div>
            </el-descriptions-item>
            <el-descriptions-item label="处理状态" :span="2">
              <el-tag v-if="viewForm.status == 0" type="warning">未处理</el-tag>
              <el-tag v-if="viewForm.status == 1" type="success">已处理</el-tag>
            </el-descriptions-item>
            <el-descriptions-item v-if="viewForm.status == 1" label="处理人">{{viewForm.handler}}</el-descriptions-item>
            <el-descriptions-item v-if="viewForm.status == 1" label="处理时间">{{viewForm.handleTime}}</el-descriptions-item>
            <el-descriptions-item v-if="viewForm.status == 1 && viewForm.reply" label="管理员回复" :span="2">
              <div style="padding:10px;background:#e8f4fd;border-radius:4px;white-space:pre-wrap;">
                {{viewForm.reply}}
              </div>
            </el-descriptions-item>
          </el-descriptions>
          <span slot="footer" class="dialog-footer">
            <el-button @click="viewVisible = false">关 闭</el-button>
          </span>
        </el-dialog>
    </div>
  </div>
</template>

<script>
  import {getSysMessagePage, removeSysMessage, handleSysMessage, getSysMessageById} from '../../../api/api' 
  export default {
    data() {
      return{
        loading: true,
        remove: [],
        handleVisible: false,
        viewVisible: false,
        handleForm: {},
        viewForm: {},
        search: {
            name: "",
            status: "",
            pageNumber: 1,
            pageSize:10
        },
        total: 0,
        tableData: []
      }
    },
    methods: {
      searchPage() {
        this.search.pageNumber = 1
        this.query()
      },
      query() {
        getSysMessagePage(this.search).then(res => {
          if(res.code == 1000) {
            this.tableData = res.data.records
            this.total = res.data.total
            this.loading = false
          } else {
            this.$notify.error({
              title: '错误',
              message: res.message
            });
          }
        })
      },
      refresh() {
        this.search.name = ""
        this.search.status = ""
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
        this.remove = []
        for (let i = 0;i < val.length;i++) {
          var item = val[i]
          this.remove.push(item.id)
        }
      },
      handleMessage(id) {
        getSysMessageById({id: id}).then(res => {
          if(res.code == 1000) {
            this.handleForm = res.data
            this.handleVisible = true
          }
        })
      },
      saveHandle() {
        if(!this.handleForm.reply) {
          this.$message.warning('请输入回复内容')
          return
        }
        
        const param = {
          id: this.handleForm.id,
          reply: this.handleForm.reply,
          status: 1,
          handler: 'admin'
        }
        
        handleSysMessage(param).then(res => {
          if(res.code == 1000) {
            this.$message.success('处理成功')
            this.handleVisible = false
            this.query()
          } else {
            this.$message.error(res.message)
          }
        })
      },
      viewMessage(row) {
        this.viewForm = row
        this.viewVisible = true
      },
      deleteDataBtn() {
        this.$confirm('此操作将永久删除选中数据, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          let ids = this.remove.join(",")
          this.deleteDate(ids)
        })
      },
      deleteDate(ids) {
        removeSysMessage({ids: ids}).then(res => {
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
      }
    },
    created() {
    },
    mounted() {
      this.query()
    }
 }
</script>

<style scoped>
.page-container {
  padding: 20px;
}
.page-header {
  margin-bottom: 20px;
}
.page-header h2 {
  margin: 0;
  color: #333;
}
.search {
  background: #fff;
  padding: 20px;
  border-radius: 4px;
  margin-bottom: 20px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}
.table {
  background: #fff;
  padding: 20px;
  border-radius: 4px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}
</style> 