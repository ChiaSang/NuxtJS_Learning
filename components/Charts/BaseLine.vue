<template>
  <div
    :auto-resize="true"
    id="BaseLine"
    ref="baseline"
    style="width: 100%; height: 300px"
  ></div>
</template>
<script>
export default {
  props: {
    mainTitle: { type: String, requires: true },
    picdata: { type: Array, requires: true },
  },
  name: 'BaseLine',
  data() {
    return {
      chartInstance: null,
      picx: [],
      picy: [],
    }
  },
  watch: {
    picdata: {
      deep: true, // 深度监听
      handler(newVal, oldVal) {
        // console.log('change: ' + newVal, oldVal)
        this.initChart()
        this.fillPicData(this.picdata)
        this.chartInstance.hideLoading()
      },
    },
  },
  mounted() {},
  methods: {
    convertTimestamp(timestamp) {
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
        // console.log(Y + M + D + h + m + s)
        return Y + M + D + h + m + s
        // 输出结果：2022-01-07 18:51:15
      } else {
        return
      }
    },
    initChart() {
      this.chartInstance = this.$echarts.init(this.$refs.baseline)
      const option = {
        xAxis: {
          type: 'category',
          boundaryGap: false,
        },
        yAxis: {
          type: 'value',
          scale: true,
        },
        grid: {
          top: '15%',
          bottom: '5%',
          left: '6%',
          right: '5%',
          containLabel: true,
        },
        // legend: {
        //   left: 20,
        //   top: '15%',
        //   icon: 'circle',
        // },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'line',
            z: 0,
            lineStyle: {
              color: '#109868',
            },
          },
        },
        // toolbox: {
        //   right: '5%',
        //   feature: {
        //     saveAsImage: {}, // 导出图片
        //     dataView: {}, // 数据视图
        //     magicType: {
        //       type: ['bar', 'line'],
        //     }, // 动态图表类型的切换
        //   },
        // },
        series: [
          {
            type: 'line',
            areaStyle: {},
          },
        ],
      }
      this.chartInstance.setOption(option)
      this.chartInstance.showLoading()
      this.$nextTick(() => {
        window.onresize = () => {
          this.chartInstance.resize()
        }
      })
    },
    fillPicData(arr) {
      // console.log('使用自身数据源')
      this.picx = arr.map(function (item) {
        var date = new Date(parseInt(item.time))
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
        // console.log(Y + M + D + h + m + s)
        return Y + M + D + h + m + s
      })
      this.picy = arr.map(function (item) {
        return item.value
      })
      const dataOption = {
        title: {
          left: 'left',
          text: this.mainTitle,
          textStyle: {
            fontSize: 12,
          },
        },
        xAxis: {
          boundaryGap: false,
          data: this.picx,
        },
        yAxis: {
          // data: hourlyTemperatureValue,
          // scale: true,
        },
        series: [
          {
            showSymbol: false,
            smooth: true, // 是否为平滑线
            data: this.picy,
          },
        ],
      }
      this.chartInstance.setOption(dataOption)
      // this.chartInstance.clear()
      // //使用刚指定的配置项和数据显示图表。
      // this.chartInstance.setOption(dataOption, true)

      this.$nextTick(() => {
        window.onresize = () => {
          this.chartInstance.resize()
        }
      })
      this.chartInstance.hideLoading()
    },
  },
}
</script>
