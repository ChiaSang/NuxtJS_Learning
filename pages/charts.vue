<template>
  <div class="container">
    <!-- <LineGradient /> -->
    <BaseLine />
    <!-- <LineGradient /> -->
  </div>
</template>

<script>
import LineGradient from '../components/Charts/LineGradient.vue'
import BaseLine from '../components/Charts/BaseLine.vue'
export default {
  components: { LineGradient, BaseLine },
}
</script>
<style scoped>
.container {
  /* margin: auto; */
  /* min-height: 80vh; */
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}
</style>