<template>
  <div>
    <b-row align-h="end">
      <b-col class="col text-right">
        <div text-variant="light">
          <small class="text-muted">
            截止到:
            {{ formateCovid19timestamp(covid19chinainfo.updateTime) }}
            全国数据统计 (感谢「丁香园」和lab.isaaclin.cn提供数据接口服务)
          </small>
        </div>
      </b-col>
    </b-row>

    <b-row>
      <b-col col lg="2" md="4" sm="4" xs="6">
        <b-card align="center" text-variant="danger">
          <b-card-sub-title
            sub-title-text-variant="danger"
            class="small sub-title-muted"
          >
            较昨日{{
              isIncr(covid19chinainfo.currentConfirmedIncr)
            }}</b-card-sub-title
          >
          <b-card-title title-tag="h2" text-variant="danger">
            {{ covid19chinainfo.currentConfirmedCount }}
          </b-card-title>
          <b-card-sub-title
            sub-title-text-variant="danger"
            class="small sub-title-muted"
            >现存确诊人数</b-card-sub-title
          >
        </b-card>
      </b-col>

      <b-col col lg="2" md="4" sm="4" xs="6">
        <b-card align="center" text-variant="warning">
          <b-card-sub-title
            sub-title-text-variant="warning"
            class="small sub-title-muted"
          >
            较昨日{{ isIncr(covid19chinainfo.confirmedIncr) }}</b-card-sub-title
          >
          <b-card-title title-tag="h2" text-variant="warning">
            {{ covid19chinainfo.confirmedCount }}
          </b-card-title>
          <b-card-sub-title
            sub-title-text-variant="warning"
            class="small sub-title-muted"
            >累计确诊人数</b-card-sub-title
          >
        </b-card>
      </b-col>

      <b-col col lg="2" md="4" sm="4" xs="6">
        <b-card align="center" text-variant="secondary">
          <b-card-sub-title
            sub-title-text-variant="secondary"
            class="small sub-title-muted"
          >
            较昨日{{ isIncr(covid19chinainfo.suspectedIncr) }}</b-card-sub-title
          >
          <b-card-title title-tag="h2" text-variant="secondary">
            {{ covid19chinainfo.suspectedCount }}
          </b-card-title>
          <b-card-sub-title
            sub-title-text-variant="secondary"
            class="small sub-title-muted"
            >疑似感染人数</b-card-sub-title
          >
        </b-card>
      </b-col>

      <b-col col lg="2" md="4" sm="4" xs="6">
        <b-card align="center" text-variant="success">
          <b-card-sub-title
            sub-title-text-variant="success"
            class="small sub-title-muted"
          >
            较昨日{{ isIncr(covid19chinainfo.curedIncr) }}</b-card-sub-title
          >
          <b-card-title title-tag="h2" text-variant="success">
            {{ covid19chinainfo.curedCount }}
          </b-card-title>
          <b-card-sub-title
            sub-title-text-variant="success"
            class="small sub-title-muted"
            >治愈人数</b-card-sub-title
          >
        </b-card>
      </b-col>

      <b-col col lg="2" md="4" sm="4" xs="6">
        <b-card align="center" text-variant="dark">
          <b-card-sub-title
            sub-title-text-variant="dark"
            class="small sub-title-muted"
          >
            较昨日{{ isIncr(covid19chinainfo.deadIncr) }}</b-card-sub-title
          >
          <b-card-title title-tag="h2" text-variant="dark">
            {{ covid19chinainfo.deadCount }}
          </b-card-title>
          <b-card-sub-title
            sub-title-text-variant="dark"
            class="small sub-title-muted"
            >死亡人数</b-card-sub-title
          >
        </b-card>
      </b-col>

      <b-col col lg="2" md="4" sm="4" xs="6">
        <b-card align="center" text-variant="primary">
          <b-card-sub-title
            sub-title-text-variant="primary"
            class="small sub-title-muted"
          >
            较昨日{{ isIncr(covid19chinainfo.seriousIncr) }}</b-card-sub-title
          >
          <b-card-title title-tag="h2" text-variant="primary">
            {{ covid19chinainfo.seriousCount }}
          </b-card-title>
          <b-card-sub-title
            sub-title-text-variant="primary"
            class="small sub-title-muted"
            >重症病例人数</b-card-sub-title
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
        var m = date.getMinutes() + ':'
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