<template>
  <div class="review-card">
    <div class="image-container">
      <img :src="review.picture.large" alt="" />
    </div>
    <div class="text-container">
      <h6>{{ review.login.username }}</h6>
      <p>精彩的文章，不错 ，点赞，继续创作。</p>
    </div>
  </div>
</template>

<script>
export default {
  props: ['review'],
}
</script>

<style scoped>
.review-card {
  margin-top: 1.5rem;
  height: 4rem;
  display: flex;
}
.text-container {
  margin-left: 2rem;
}
img {
  width: 4rem;
  height: 4rem;
  border-radius: 100%;
}
p {
  color: grey;
}
</style>