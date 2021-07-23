<template>
  <div class="row">
    <div class="col-lg-6 col-md-6 col-sm-12 col-12">
      <b-card class="align-items-center d-flex justify-content-center">
        <LineGradient />
      </b-card>
    </div>
    <div class="col-md-6 col-xs-12">
      <b-card class="align-items-center d-flex justify-content-center">
        <BaseLine />
      </b-card>
    </div>
    <div class="col-md-6 col-xs-12">
      <b-card class="align-items-center d-flex justify-content-center">
        <LineGradient />
      </b-card>
    </div>
    <div class="col-md-6 col-xs-12">
      <b-card class="align-items-center d-flex justify-content-center">
        <BaseLine />
      </b-card>
    </div>
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
.card {
  margin-bottom: 30px;
}
.card-body {
  margin: 0 auto;
  padding: 0rem;
  margin-top: 20px;
  margin-bottom: 20px;
  max-height: 320px;
}
</style>
