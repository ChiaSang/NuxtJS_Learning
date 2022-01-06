<template>
  <div>
    <Covid19Board
    :covid19chinainfo="covid19chinainfo"
    :covid19globalinfo="covid19globalinfo"
     />
  </div>
</template>

<script>
import Covid19Board from '../components/covid19/Covid19Board'
export default {
  components: { Covid19Board },
  data() {
    return {
      covid19chinainfo: {
        currentConfirmedCount: '',
        currentConfirmedIncr: '',
        confirmedCount: '',
        confirmedIncr: '',
        suspectedCount: '',
        suspectedIncr: '',
        curedCount: '',
        curedIncr: '',
        deadCount: '',
        deadIncr: '',
        seriousCount: '',
        seriousIncr: '',
        updateTime: '',
      },
      covid19globalinfo: {
        currentConfirmedCount: '',
        currentConfirmedIncr: '',
        confirmedCount: '',
        confirmedIncr: '',
        curedCount: '',
        curedIncr: '',
        deadCount: '',
        deadIncr: '',
        yesterdayConfirmedCountIncr: ''
      },
    }
  },
  mounted() {
    this.getCovid19Board()
  },
  methods: {
    getCovid19Board() {
      // 获取疫情告示牌信息
      //
      // currentConfirmedCount(Incr)	现存确诊人数（较昨日增加数量）值为confirmedCount(Incr) - curedCount(Incr) - deadCount(Incr)
      // confirmedCount(Incr)	累计确诊人数（较昨日增加数量）
      // suspectedCount(Incr)	疑似感染人数（较昨日增加数量）
      // curedCount(Incr)	治愈人数（较昨日增加数量）
      // deadCount(Incr)	死亡人数（较昨日增加数量）
      // seriousCount(Incr)	重症病例人数（较昨日增加数量）
      // updateTime	数据最后变动时间
      this.$axios
        .get('https://lab.isaaclin.cn/nCoV/api/overall')
        .then((res) => {
          console.log('getBoard:' + res.data.success)
          if (res.data.success === true) {
            // this.covid19info = res.data.results[0]
            // console.log(res.data.results[0])
            // console.log(this.covid19chinainfo)
            this.covid19chinainfo.currentConfirmedCount =res.data.results[0].currentConfirmedCount
            this.covid19chinainfo.currentConfirmedIncr =res.data.results[0].currentConfirmedIncr
            this.covid19chinainfo.confirmedCount = res.data.results[0].confirmedCount
            this.covid19chinainfo.confirmedIncr = res.data.results[0].confirmedIncr
            this.covid19chinainfo.suspectedCount = res.data.results[0].suspectedCount
            this.covid19chinainfo.suspectedIncr = res.data.results[0].suspectedIncr
            this.covid19chinainfo.curedCount = res.data.results[0].curedCount
            this.covid19chinainfo.curedIncr = res.data.results[0].curedIncr
            this.covid19chinainfo.deadCount = res.data.results[0].deadCount
            this.covid19chinainfo.deadIncr = res.data.results[0].deadIncr
            this.covid19chinainfo.seriousCount = res.data.results[0].seriousCount
            this.covid19chinainfo.seriousIncr = res.data.results[0].seriousIncr
            this.covid19chinainfo.updateTime = res.data.results[0].updateTime


            this.covid19globalinfo.currentConfirmedCount =res.data.results[0].globalStatistics.currentConfirmedCount
            this.covid19globalinfo.currentConfirmedIncr =res.data.results[0].globalStatistics.currentConfirmedIncr
            this.covid19globalinfo.confirmedCount = res.data.results[0].globalStatistics.confirmedCount
            this.covid19globalinfo.confirmedIncr = res.data.results[0].globalStatistics.confirmedIncr
            this.covid19globalinfo.curedCount = res.data.results[0].globalStatistics.curedCount
            this.covid19globalinfo.curedIncr = res.data.results[0].globalStatistics.curedIncr
            this.covid19globalinfo.deadCount = res.data.results[0].globalStatistics.deadCount
            this.covid19globalinfo.deadIncr = res.data.results[0].globalStatistics.deadIncr
            this.covid19globalinfo.yesterdayConfirmedCountIncr = res.data.results[0].globalStatistics.yesterdayConfirmedCountIncr
          }
        })
    },
  },
}
</script>

<style>
</style>