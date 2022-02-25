<template>
  <div>
    <b-row align-h="end">
      <b-col class="col text-right">
        <div text-variant="light">
          <small class="text-muted">
            数据截止:
            {{ formateCovid19timestamp(covid19chinainfo.updateTime) }}
          </small>
        </div>
      </b-col>
    </b-row>

    <b-row>
      <b-col
       col lg="3"
       md="3"
       sm="6"
       xs="6"
       class="mt-2"
       v-for="item in 7" :key="item"
       >
        <b-card align="center" text-variant="info">
          <b-card-sub-title
            sub-title-text-variant="info"
            class="small sub-title-muted"
          >
            较昨日{{
              isIncr(covid19chinainfo.currentConfirmedIncr)
            }}</b-card-sub-title
          >
          <b-card-title title-tag="h2" text-variant="info">
            {{ covid19chinainfo.currentConfirmedCount }}
          </b-card-title>
          <b-card-sub-title
            sub-title-text-variant="info"
            class="small sub-title-muted"
            >现存确诊人数</b-card-sub-title
          >
        </b-card>
      </b-col>

    </b-row>
  </div>
</template>

<script>
export default {
  props: {
    covid19chinainfo: {
      type: Object,
      requires: true,
      default: function () {
        return {}
      },
    },
    covid19globalinfo: {
      type: Object,
      requires: true,
      default: function () {
        return {}
      },
    },
  },
  data() {
    return {}
  },
  mounted() {
    console.log('covid19chinainfo' + JSON.stringify(this.covid19chinainfo))
    console.log('covid19globalinfo' + JSON.stringify(this.covid19globalinfo))
  },
  methods: {
    formateCovid19timestamp(timestamp) {
      // 比如需要这样的格式 yyyy-MM-dd hh:mm:ss
      if (timestamp) {
        var date = new Date(timestamp)
        var Y = date.getFullYear() + '-'
        var M =
          (date.getMonth() + 1 < 10
            ? '0' + (date.getMonth() + 1)
            : date.getMonth() + 1) + '-'
        var D =
          (date.getDate() + 1 < 10
            ? '0' + (date.getDate() + 1)
            : date.getDate()) + ' '
        var h = date.getHours() + ':'
        var m =
          date.getMinutes() + 1 < 10
            ? '0' + date.getMinutes() + ':'
            : date.getMinutes() + ':'
        var s = date.getSeconds()
        console.log(Y + M + D + h + m + s)
        return Y + M + D + h + m + s
        // 输出结果：2022-01-07 18:51:15
      } else {
        return
      }
    },
    isIncr(incr) {
      return incr >= 0 ? '+' + incr : incr
    },
  },
}
</script>

<style>
</style>