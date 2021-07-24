<template>
  <b-container fluid>
    <b-row align-v="center">
      <b-col align-self="center" lg="4" md="6" sm="12" xs="12">
        <div style="border:1px solid grey">
        <base-line />
        </div>
      </b-col>
      <b-col align-self="center" lg="4" md="6" sm="12" xs="12">
        <div style="border:1px solid grey">
        <base-line />
        </div>
      </b-col>
      <b-col align-self="center" lg="4" md="6" sm="12" xs="12">
        <div style="border:1px solid grey">
        <line-gradient />
        </div>
      </b-col>
      <b-col align-self="center" lg="4" md="6" sm="12" xs="12">
        <div style="border:1px solid grey">
        <line-gradient />
        </div>
      </b-col>
      <b-col align-self="center" lg="4" md="6" sm="12" xs="12">
        <div style="border:1px solid grey">
        <base-line />
        </div>
      </b-col>
      <!-- <div
        class="col-lg-4 col-md-12 col-sm-12 col-xs-12"
        style="margin: 2px; border: 1px solid grey"
      >
        <base-line />
      </div>
      <div
        class="col-lg-4 col-md-12 col-sm-12 col-xs-12"
        style="margin: 2px; border: 1px solid grey"
      >
        <line-gradient />
      </div>
      <div
        class="col-lg-4 col-md-12 col-sm-12 col-xs-12"
        style="margin: 2px; border: 1px solid grey"
      >
        <base-line /> -->
      </div>
    </b-row>
  </b-container>
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
