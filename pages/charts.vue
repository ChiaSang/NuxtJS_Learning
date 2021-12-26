<template>
  <b-container fluid>
    <b-row align-v="center">
      <b-col align-self="center" lg="4" md="6" sm="12" xs="12">
        <div style="border: 1px solid grey">
          <base-line :mainTitle="name1" />
        </div>
      </b-col>

      <b-col align-self="center" lg="4" md="6" sm="12" xs="12">
        <div style="border: 1px solid grey">
          <line-gradient :mainTitle="name6" :picdata="picdata1" />
        </div>
      </b-col>
      <b-col align-self="center" lg="4" md="6" sm="12" xs="12">
        <div style="border: 1px solid grey">
          <line-gradient :mainTitle="name7" :picdata="picdata2" />
        </div>
      </b-col>

      <b-col align-self="center" lg="4" md="6" sm="12" xs="12">
        <div style="border: 1px solid grey">
          <base-line :mainTitle="name2" :picdata="picdata3" />
        </div>
      </b-col>
      <b-col align-self="center" lg="4" md="6" sm="12" xs="12">
        <div style="border: 1px solid grey">
          <base-line :mainTitle="name3" :picdata="picdata4" />
        </div>
      </b-col>
      <b-col align-self="center" lg="4" md="6" sm="12" xs="12">
        <div style="border: 1px solid grey">
          <base-line :mainTitle="name4" :picdata="picdata5" />
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
      <!-- </div> -->
    </b-row>

    <div class="title">技术支持：河南翰林网络技术开发有限公司</div>
  </b-container>
</template>

<script>
import LineGradient from '../components/Charts/LineGradient.vue'
import BaseLine from '../components/Charts/BaseLine.vue'
export default {
  components: { LineGradient, BaseLine },
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
    }
  },
  created() {
    this.newTimeArray()
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
