<template>
  <div class="container" id="BaseLine">
    <div id="main" style="width: 800px; height: 500px"></div>
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
    this.drawChart()
    this.fetchData()
  },
  methods: {
    drawChart() {
      var chartDom = document.getElementById('main')
      var myChart = this.$echarts.init(chartDom)
      var option

      option = {
        xAxis: {
          type: 'category',
          data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        },
        yAxis: {
          type: 'value',
          scale: true, //从y的最小值开始
        },
        series: [
          {
            data: [150, 230, 224, 218, 135, 147, 260],
            type: 'line',
            markPoint: {
              // 标记点
              data: [
                {
                  type: 'max',
                },
                {
                  type: 'min',
                },
              ],
            },
            markLine: {
              // 标记线
              data: [
                {
                  type: 'average',
                },
              ],
            },
            markArea: {
              // 标记区域
              data: [
                [
                  {
                    xAxis: 'Mon',
                  },
                  {
                    xAxis: 'Thu',
                  },
                ],
              ],
            },
            smooth: true, // 是否为平滑线
            lineStyle: {
              // 线的样式设置
              color: 'green',
              type: 'solid', // dashed dotted solid
            },
            areaStyle: {
              // 线和x轴形成的区域设置
              color: 'pink',
            },
          },
        ],
      }
      myChart.setOption(option)
    },
    async fetchData() {
      //Fetch风格请求方式
      this.weather = await this.$axios.$get(
        '/api/113.82,34.03/weather.json'
      )
      console.log(this.weather)
    },
  },
}
</script>