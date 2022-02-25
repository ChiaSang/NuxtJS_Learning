<template>
  <b-container fluid>
    <Bulletin
      :covid19chinainfo="covid19chinainfo"
      :covid19globalinfo="covid19globalinfo"
    />
    <b-row class="mt-4" align-v="center">
      <b-col align-self="center" lg="12" md="6" sm="12" xs="12">
        <div style="border: 1px solid grey">
          <base-line :mainTitle="name1" />
        </div>
      </b-col>
    </b-row>
    <hr />
    <div class="title">技术支持：河南翰林网络技术开发有限公司</div>
  </b-container>
</template>

<script>
import LineGradient from '../components/Charts/LineGradient.vue'
import BaseLine from '../components/Charts/BaseLine.vue'
import Bulletin from '../components/bulletin-board/Bulletin'
export default {
  components: { LineGradient, BaseLine, Bulletin },
  data() {
    return {
      minNum: 26,
      maxNum: 70,
      name1: '今日气温',
      name2: '1#进水温度',
      name3: '1#出水温度',
      name4: '121室温度',
      name5: '3#出水温度',
      name6: '主管路进水温度',
      name7: '主管路出水温度',
      picdata1: [],
      picdata2: [],
      picdata3: [],
      picdata4: [],
      picdata5: [],
      picdata6: [],
      // picdata1: Array.from({ length: 20 }, (v, i) => {
      //   return v + 1, i * Math.floor(Math.random() * 10);
      // }),

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
        yesterdayConfirmedCountIncr: '',
      },
    }
  },
  created() {
    this.newTimeArray()
  },
  mounted() {
    this.getCovid19Board()
  },
  methods: {
    randomNum(minNum, maxNum) {
      switch (arguments.length) {
        case 1:
          return parseInt(Math.random() * minNum + 1, 10)
          break
        case 2:
          return parseInt(Math.random() * (maxNum - minNum + 1) + minNum, 10)
          break
        default:
          return 0
          break
      }
    },
    newTimeArray() {
      // 图数组
      const picArray1 = []
      const picArray2 = []
      const picArray3 = []
      const picArray4 = []
      const picArray5 = []
      const picArray6 = []
      // 起始时间
      const date = new Date()
      // 数组长度
      const length = 50
      // 时长间隔 ms
      const size = 5 * 60 * 1000
      const label = (v) => (v < 10 ? `0${v}` : v)
      while (picArray1.length < length) {
        const arr1 = []
        const arr2 = []
        const arr3 = []
        const arr4 = []
        const arr5 = []
        const arr6 = []
        let ranFlag = this.randomNum(this.minNum, this.maxNum)
        arr1.push(
          `${label(date.getHours())}:${label(date.getMinutes())}`,
          this.randomNum(40, 60)
        )
        arr2.push(
          `${label(date.getHours())}:${label(date.getMinutes())}`,
          this.randomNum(40, 60) - Math.floor(Math.random() * 10)
        )
        arr3.push(
          `${label(date.getHours())}:${label(date.getMinutes())}`,
          this.randomNum(50, 55)
        )
        arr4.push(
          `${label(date.getHours())}:${label(date.getMinutes())}`,
          this.randomNum(40, 50)
        )
        arr5.push(
          `${label(date.getHours())}:${label(date.getMinutes())}`,
          this.randomNum(42, 45)
        )
        arr6.push(
          `${label(date.getHours())}:${label(date.getMinutes())}`,
          ranFlag - this.randomNum(0, 5)
        )
        date.setTime(date.getTime() - size)
        // console.log(ary);

        picArray1.push(arr1)
        picArray2.push(arr2)
        picArray3.push(arr3)
        picArray4.push(arr4)
        picArray5.push(arr5)
        picArray6.push(arr6)
      }
      this.picdata1 = picArray1.reverse()
      this.picdata2 = picArray2.reverse()
      this.picdata3 = picArray3.reverse()
      this.picdata4 = picArray4.reverse()
      this.picdata5 = picArray5.reverse()
      this.picdata6 = picArray6.reverse()
      // console.log(picArray);
    },

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
            this.covid19chinainfo.currentConfirmedCount =
              res.data.results[0].currentConfirmedCount
            this.covid19chinainfo.currentConfirmedIncr =
              res.data.results[0].currentConfirmedIncr
            this.covid19chinainfo.confirmedCount =
              res.data.results[0].confirmedCount
            this.covid19chinainfo.confirmedIncr =
              res.data.results[0].confirmedIncr
            this.covid19chinainfo.suspectedCount =
              res.data.results[0].suspectedCount
            this.covid19chinainfo.suspectedIncr =
              res.data.results[0].suspectedIncr
            this.covid19chinainfo.curedCount = res.data.results[0].curedCount
            this.covid19chinainfo.curedIncr = res.data.results[0].curedIncr
            this.covid19chinainfo.deadCount = res.data.results[0].deadCount
            this.covid19chinainfo.deadIncr = res.data.results[0].deadIncr
            this.covid19chinainfo.seriousCount =
              res.data.results[0].seriousCount
            this.covid19chinainfo.seriousIncr = res.data.results[0].seriousIncr
            this.covid19chinainfo.updateTime = res.data.results[0].updateTime
            this.covid19globalinfo.currentConfirmedCount =
              res.data.results[0].globalStatistics.currentConfirmedCount
            this.covid19globalinfo.currentConfirmedIncr =
              res.data.results[0].globalStatistics.currentConfirmedIncr
            this.covid19globalinfo.confirmedCount =
              res.data.results[0].globalStatistics.confirmedCount
            this.covid19globalinfo.confirmedIncr =
              res.data.results[0].globalStatistics.confirmedIncr
            this.covid19globalinfo.curedCount =
              res.data.results[0].globalStatistics.curedCount
            this.covid19globalinfo.curedIncr =
              res.data.results[0].globalStatistics.curedIncr
            this.covid19globalinfo.deadCount =
              res.data.results[0].globalStatistics.deadCount
            this.covid19globalinfo.deadIncr =
              res.data.results[0].globalStatistics.deadIncr
            this.covid19globalinfo.yesterdayConfirmedCountIncr =
              res.data.results[0].globalStatistics.yesterdayConfirmedCountIncr
          }
        })
    },
  },
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
