<template>
  <div class="container">
    <MainPic />
    <IntroductionCard />
  </div>
</template>

<script>
import IntroductionCard from '../components/IntroductionCard.vue'
import MainPic from '../components/MainPic.vue'
export default {
  components: { MainPic, IntroductionCard },
}
</script>


