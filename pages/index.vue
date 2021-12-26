<template>
  <div class="container">
    <MainPic />
    <IntroductionCard />
    <div class="title">技术支持：河南翰林网络技术开发有限公司</div>
  </div>
</template>

<script>
import IntroductionCard from '../components/IntroductionCard.vue'
import MainPic from '../components/MainPic.vue'
export default {
  components: { MainPic, IntroductionCard },
  // middleware({ store, route, redirect, params, query, req, res }) {
  //   redirect('/charts') // 默认跳转页面的路由
  // },
}
</script>


<style>
.title {
  position: relative;
  font-size: 16px;
  color: #999;
  /* 溢出隐藏 重要*/
  overflow: hidden;
  text-align: center;
}
.title::before,
.title::after {
  content: '';
  display: inline-block;
  width: 100%;
  height: 1px;
  color: black;
  position: absolute;
  top: 50%;
}
.title::before {
  margin-left: -10px;
  transform: translateX(-100%);
}
.title::after {
  margin-left: 10px;
}
</style>