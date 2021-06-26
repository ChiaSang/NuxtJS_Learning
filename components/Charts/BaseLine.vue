<template>
  <div id="BaseLine" ref="baseline" style="width: 500px; height: 300px"></div>
</template>
<script>
export default {
  name: 'BaseLine',
  data() {
    return {
      weather: null,
    }
  },
  mounted() {
    this.initChart()
    this.fetchData()
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
    },
    async fetchData() {
      this.weather = await this.$axios.$get('/api/113.82,34.03/weather.json')
      this.updateChart()
      this.chartInstance.hideLoading()
    },
    updateChart() {
      const results = this.weather.result
      const hourlyTemperature = results.hourly.temperature
      const hourlyTemperatureDate = hourlyTemperature.map(function (item) {
        return item.datetime.slice(0, 16)
      })
      const hourlyTemperatureValue = hourlyTemperature.map(function (item) {
        return item.value
      })
      const dataOption = {
        title: {
          left: 'left',
          text: '48小时天气预报气温图',
          textStyle: {
            fontSize: 12,
          },
        },
        xAxis: {
          boundaryGap: false,
          data: hourlyTemperatureDate,
        },
        yAxis: {
          // data: hourlyTemperatureValue,
          // scale: true,
        },
        series: [
          {
            showSymbol: false,
            smooth: true, // 是否为平滑线
            data: hourlyTemperatureValue,
          },
        ],
      }
      this.chartInstance.setOption(dataOption)
    },
  },
}
</script>
