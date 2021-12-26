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
      weather: null,
      chartInstance: null,
      picdate: [],
      picvalue: [],
    }
  },
  mounted() {
    this.getData(this.picdata)
    // this.initChart()
    // this.fetchData()
  },
  methods: {
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
        toolbox: {
          right: '5%',
          feature: {
            saveAsImage: {}, // 导出图片
            dataView: {}, // 数据视图
            magicType: {
              type: ['bar', 'line'],
            }, // 动态图表类型的切换
          },
        },
        series: [
          {
            type: 'line',
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
    async fetchData() {
      this.weather = await this.$axios.$get('/api/113.82,34.03/weather.json')
      this.updateChart()
      this.chartInstance.hideLoading()
    },
    updateChart() {
      const results = this.weather.result
      const hourlyTemperature = results.hourly.temperature
      this.picdate = hourlyTemperature.map(function (item) {
        return item.datetime.slice(0, 100)
      })
      this.picvalue = hourlyTemperature.map(function (item) {
        return item.value
      })
      // const hourlyTemperatureDate = hourlyTemperature.map(function (item) {
      //   return item.datetime.slice(0, 100)
      // })
      // const hourlyTemperatureValue = hourlyTemperature.map(function (item) {
      //   return item.value
      // })
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
          data: this.picdate,
        },
        yAxis: {
          // data: hourlyTemperatureValue,
          // scale: true,
        },
        series: [
          {
            showSymbol: false,
            smooth: true, // 是否为平滑线
            data: this.picvalue,
          },
        ],
      }
      this.chartInstance.setOption(dataOption)
      this.$nextTick(() => {
        window.onresize = () => {
          this.chartInstance.resize()
        }
      })
      // console.log(hourlyTemperatureDate)
      // console.log(hourlyTemperatureValue)
    },
    getData(arr) {
      if (arr) {
        console.log('使用自身数据源')
        this.picdate = arr.map(function (item) {
          return item[0]
        })
        this.picvalue = arr.map(function (item) {
          return item[1]
        })
        // console.log(this.picdate)
        // console.log(this.picvalue)
        this.initChart()

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
            data: this.picdate,
          },
          yAxis: {
            // data: hourlyTemperatureValue,
            // scale: true,
          },
          series: [
            {
              showSymbol: false,
              smooth: true, // 是否为平滑线
              data: this.picvalue,
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
      } else {
        this.initChart()
        this.fetchData()
      }
    },
  },
}
</script>
