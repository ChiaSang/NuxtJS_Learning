<template>
  <b-card-group class="intrCard">
    <b-card class="card-main">
      <h4 class="card-title">简约</h4>
      <b-card-text class="card-text">
        使用特别简单，只需几步即可完成
      </b-card-text>
    </b-card>
    <b-card class="card-main">
      <h4 class="card-title">流畅</h4>
      <b-card-text class="card-text">
        操作十分流畅，削减繁琐步骤更加跟手
      </b-card-text>
    </b-card>
    <b-card class="card-main">
      <h4 class="card-title">好看</h4>
      <b-card-text class="card-text">
        界面甚是好看，取BootStrap样式带来舒适体验
      </b-card-text>
    </b-card>
  </b-card-group>
</template>

<script>
export default {}
</script>

<style scoped>
.intrCard {
  margin-top: 8rem;
}
.card {
  border: none;
  margin-bottom: 2rem;
}
.card-main {
  align-items: center;
  display: flex;
}
.card-title {
  color: #41b883;
  font-size: 2rem;
  font-weight: 500;
  text-align: center;
}
.card-text {
  color: #606fa5;
  font-weight: 300;
  /* font-size: 1.25rem; */
}
</style>