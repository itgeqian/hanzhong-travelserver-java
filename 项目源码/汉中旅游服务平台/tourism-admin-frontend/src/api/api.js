import request, { post, get } from "@/utils/request";

// export function products(params) {
//     return request({
//       url: "/api/v1/products",  //接口路径
//       method: "get",  //接口方法
//       headers: { 'Content-Type': 'multipart/form-data' }, //给接口添加请求头
//       params  //接口参数
//     });
// }

//-------------------------------登陆---------------------------------------
// 登陆
export const login = (params) => post("/login",params)
//登出
export const logout = () => get("/login/logout")

//-------------------------------用户---------------------------------------
// 查询用户
export const getUserPage = (params) => post("/user/getUserPage",params)
//根据id查询用户
export const getUserById = (params) => get("/user/getUserById",params)
//保存用户
export const saveUser = (params) => post("/user/saveUser",params)
//更新用户
export const editUser = (params) => post("/user/editUser",params)
//审核律师
export const toExamine = (params) => post("/user/toExamine",params)
//删除用户
export const removeUser = (params) => get("/user/removeUser",params)
//重置密码
export const resetPassword = (params) => post("/user/resetPassword",params)
//获取登陆用户信息
export const getUser = () => get("/user/getUserInfo")
//修改个人信息
export const setUserInfo = (params) => post("/user/setUserInfo",params)
//修改个人头像
export const setUserAvatar = (params) => get("/user/setUserAvatar",params)

export const changePassword = (params) => post("/user/changePassword",params)

//-------------------------------景点---------------------------------------
//查询景点
export const getSysAttractionsPage = (params) => post("/attractions/getSysAttractionsPage",params)
//根据id查询景点
export const getSysAttractionsById = (params) => get("/attractions/getSysAttractionsById",params)
//保存景点
export const saveSysAttractions = (params) => post("/attractions/saveSysAttractions",params)
//更新景点
export const editSysAttractions = (params) => post("/attractions/editSysAttractions",params)
//删除SysAttractions
export const removeSysAttractions = (params) => get("/attractions/removeSysAttractions",params)
//后去列表
export const getSysAttractionsList = (params) => get("/attractions/getSysAttractionsList",params)

//-------------------------------旅游线路---------------------------------------
//查询旅游线路
export const getSysLinePage = (params) => post("/line/getSysLinePage",params)
//根据id查询旅游线路
export const getSysLineById = (params) => get("/line/getSysLineById",params)
//保存旅游线路
export const saveSysLine = (params) => post("/line/saveSysLine",params)
//更新旅游线路
export const editSysLine = (params) => post("/line/editSysLine",params)
//删除SysLine
export const removeSysLine = (params) => get("/line/removeSysLine",params)

//-------------------------------酒店---------------------------------------
//查询酒店
export const getSysHotelPage = (params) => post("/hotel/getSysHotelPage",params)
//根据id查询酒店
export const getSysHotelById = (params) => get("/hotel/getSysHotelById",params)
//保存酒店
export const saveSysHotel = (params) => post("/hotel/saveSysHotel",params)
//更新酒店
export const editSysHotel = (params) => post("/hotel/editSysHotel",params)
//删除SysHotel
export const removeSysHotel = (params) => get("/hotel/removeSysHotel",params)

//-------------------------------房型---------------------------------------
//查询房型
export const getSysHotelItemPage = (params) => post("/item/getSysHotelItemPage",params)
//根据id查询房型
export const getSysHotelItemById = (params) => get("/item/getSysHotelItemById",params)
//保存房型
export const saveSysHotelItem = (params) => post("/item/saveSysHotelItem",params)
//更新房型
export const editSysHotelItem = (params) => post("/item/editSysHotelItem",params)
//删除SysHotelItem
export const removeSysHotelItem = (params) => get("/item/removeSysHotelItem",params)

//-------------------------------资讯---------------------------------------
//查询资讯
export const getSysForumPage = (params) => post("/forum/getSysForumPage",params)
//根据id查询资讯
export const getSysForumById = (params) => get("/forum/getSysForumById",params)
//保存资讯
export const saveSysForum = (params) => post("/forum/saveSysForum",params)
//更新资讯
export const editSysForum = (params) => post("/forum/editSysForum",params)
//删除SysForum
export const removeSysForum = (params) => get("/forum/removeSysForum",params)

//-------------------------------评论---------------------------------------
//查询评论
export const getSysCommentsPage = (params) => post("/comments/getSysCommentsPage",params)
//根据id查询评论
export const getSysCommentsById = (params) => get("/comments/getSysCommentsById",params)
//保存评论
export const saveSysComments = (params) => post("/comments/saveSysComments",params)
//更新评论
export const editSysComments = (params) => post("/comments/editSysComments",params)
//删除SysComments
export const removeSysComments = (params) => get("/comments/removeSysComments",params)

//-------------------------------景点预约---------------------------------------
//查询景点预约
export const getSysAttractionOrderPage = (params) => post("/order/getSysAttractionOrderPage",params)
//根据id查询景点预约
export const getSysAttractionOrderById = (params) => get("/order/getSysAttractionOrderById",params)
//保存景点预约
export const saveSysAttractionOrder = (params) => post("/order/saveSysAttractionOrder",params)
//更新景点预约
export const editSysAttractionOrder = (params) => post("/order/editSysAttractionOrder",params)
//删除SysAttractionOrder
export const removeSysAttractionOrder = (params) => get("/order/removeSysAttractionOrder",params)

//-------------------------------酒店预约---------------------------------------
//查询酒店预约
export const getSysHotelOrderPage = (params) => post("/order/getSysHotelOrderPage",params)
//根据id查询酒店预约
export const getSysHotelOrderById = (params) => get("/order/getSysHotelOrderById",params)
//保存酒店预约
export const saveSysHotelOrder = (params) => post("/order/saveSysHotelOrder",params)
//更新酒店预约
export const editSysHotelOrder = (params) => post("/order/editSysHotelOrder",params)
//删除SysHotelOrder
export const removeSysHotelOrder = (params) => get("/order/removeSysHotelOrder",params)

//-------------------------------轮播图---------------------------------------
//查询轮播图
export const getSysRotationsPage = (params) => post("/rotations/getSysRotationsPage",params)
//根据id查询轮播图
export const getSysRotationsById = (params) => get("/rotations/getSysRotationsById",params)
//保存轮播图
export const saveSysRotations = (params) => post("/rotations/saveSysRotations",params)
//更新轮播图
export const editSysRotations = (params) => post("/rotations/editSysRotations",params)
//删除SysRotations
export const removeSysRotations = (params) => get("/rotations/removeSysRotations",params)

export const getManageData = (params) => get("/login/getManageData",params)

//-------------------------------美食推荐---------------------------------------
//查询美食推荐
export const getSysFoodPage = (params) => post("/food/getSysFoodPage",params)
//根据id查询美食推荐
export const getSysFoodById = (params) => get("/food/getSysFoodById",params)
//保存美食推荐
export const saveSysFood = (params) => post("/food/saveSysFood",params)
//更新美食推荐
export const editSysFood = (params) => post("/food/editSysFood",params)
//删除SysFood
export const removeSysFood = (params) => get("/food/removeSysFood",params)
//获取美食推荐列表
export const getSysFoodList = (params) => get("/food/getSysFoodList",params)

//-------------------------------汉文化活动---------------------------------------
//查询汉文化活动
export const getSysCulturePage = (params) => post("/culture/getSysCulturePage",params)
//根据id查询汉文化活动
export const getSysCultureById = (params) => get("/culture/getSysCultureById",params)
//保存汉文化活动
export const saveSysCulture = (params) => post("/culture/saveSysCulture",params)
//更新汉文化活动
export const editSysCulture = (params) => post("/culture/editSysCulture",params)
//删除SysCulture
export const removeSysCulture = (params) => get("/culture/removeSysCulture",params)
//获取汉文化活动列表
export const getSysCultureList = (params) => get("/culture/getSysCultureList",params)

//-------------------------------联系我们---------------------------------------
//查询联系我们
export const getSysContactPage = (params) => post("/contact/getSysContactPage",params)
//根据id查询联系我们
export const getSysContactById = (params) => get("/contact/getSysContactById",params)
//保存联系我们
export const saveSysContact = (params) => post("/contact/saveSysContact",params)
//更新联系我们
export const editSysContact = (params) => post("/contact/editSysContact",params)
//删除SysContact
export const removeSysContact = (params) => get("/contact/removeSysContact",params)
//获取联系我们列表
export const getSysContactList = (params) => get("/contact/getSysContactList",params)

//-------------------------------用户留言---------------------------------------
//查询用户留言
export const getSysMessagePage = (params) => post("/message/getSysMessagePage",params)
//根据id查询用户留言
export const getSysMessageById = (params) => get("/message/getSysMessageById",params)
//处理用户留言
export const handleSysMessage = (params) => post("/message/handleSysMessage",params)
//删除用户留言
export const removeSysMessage = (params) => get("/message/removeSysMessage",params)
//获取用户留言列表
export const getSysMessageList = (params) => get("/message/getSysMessageList",params)

