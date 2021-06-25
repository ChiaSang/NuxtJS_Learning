<template>
  <div class="container" id="BaseLine">
    <div class="row">
      <div ref="baseline" class="col" style="width: 800px; height: 500px"></div>
    </div>
  </div>
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
        animation: true,
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
          bottom: '15%',
        },
        // legend: {
        //   left: 20,
        //   top: '15%',
        //   icon: 'circle',
        // },
        tooltip: {
          trigger: 'axis',
        },
        toolbox: {
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
            smooth: true, // 是否为平滑线
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
        title: [
          {
            left: 'center',
            text: '48小时天气预报气温图',
          },
        ],
        xAxis: {
          type: 'category',
          data: hourlyTemperatureDate,
        },
        yAxis: {
          type: 'value',
          data: hourlyTemperatureValue,
        },
        series: [
          {
            data: hourlyTemperatureValue,
          },
        ],
      }
      this.chartInstance.setOption(dataOption)
    },
  },
}
</script>
