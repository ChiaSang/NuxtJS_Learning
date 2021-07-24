<template>
  <div
    id="LineGradient"
    ref="gradientline"
    style="width: 100%; height: 300px"
  ></div>
</template>
<script>
export default {
  name: 'LineGradient',
  mounted() {
    this.initChart()
  },
  methods: {
    initChart() {
      this.chartInstance = this.$echarts.init(this.$refs.gradientline)
      const data = [
        ['2000-06-01', 116],
        ['2000-06-02', 115],
        ['2000-06-03', 114],
        ['2000-06-04', 113],
        ['2000-06-05', 112],
        ['2000-06-06', 111],
        ['2000-06-07', 110],
        ['2000-06-08', 109],
        ['2000-06-09', 108],
        ['2000-06-10', 107],
        ['2000-06-11', 106],
        ['2000-06-12', 105],
        ['2000-06-13', 299],
        ['2000-06-14', 103],
        ['2000-06-15', 102],
        ['2000-06-16', 101],
        ['2000-06-17', 100],
        ['2000-06-18', 99],
        ['2000-06-19', 98],
        ['2000-06-20', 97],
        ['2000-06-21', 96],
        ['2000-06-22', 95],
        ['2000-06-23', 298],
        ['2000-06-24', 93],
        ['2000-06-25', 92],
        ['2000-06-26', 91],
        ['2000-06-27', 90],
        ['2000-06-28', 54],
        ['2000-06-29', 88],
        ['2000-06-30', 87],
        ['2000-07-01', 86],
        ['2000-07-02', 85],
        ['2000-07-03', 25],
        ['2000-07-04', 83],
        ['2000-07-05', 82],
        ['2000-07-06', 81],
        ['2000-07-07', 254],
        ['2000-07-08', 79],
        ['2000-07-09', 78],
        ['2000-07-10', 358],
        ['2000-07-11', 76],
        ['2000-07-12', 75],
        ['2000-07-13', 74],
        ['2000-07-14', 73],
        ['2000-07-15', 72],
        ['2000-07-16', 116],
        ['2000-07-17', 115],
        ['2000-07-18', 114],
        ['2000-07-19', 113],
        ['2000-07-20', 112],
        ['2000-07-21', 111],
        ['2000-07-22', 110],
        ['2000-07-23', 109],
        ['2000-07-24', 108],
        ['2000-07-25', 107],
        ['2000-07-26', 106],
        ['2000-07-27', 105],
        ['2000-07-28', 104],
        ['2000-07-29', 103],
        ['2000-07-30', 102],
        ['2000-07-31', 101],
        ['2000-08-01', 100],
        ['2000-08-02', 99],
        ['2000-08-03', 98],
        ['2000-08-04', 97],
        ['2000-08-05', 96],
        ['2000-08-06', 689],
        ['2000-08-07', 94],
        ['2000-08-08', 652],
        ['2000-08-09', 92],
        ['2000-08-10', 254],
        ['2000-08-11', 90],
        ['2000-08-12', 89],
        ['2000-08-13', 88],
      ]

      var dateList = data.map(function (item) {
        return item[0]
      })
      var valueList = data.map(function (item) {
        return item[1]
      })

      const option = {
        // Make gradient line here
        visualMap: [
          {
            show: false,
            type: 'continuous',
            seriesIndex: 0,
            min: 0,
            max: 500,
          },
          // {
          //   show: false,
          //   type: 'continuous',
          //   seriesIndex: 1,
          //   dimension: 0,
          //   min: 0,
          //   max: dateList.length - 1,
          // },
        ],

        title: {
          left: 'left',
          text: '沿Y轴根据值渐变效果',
          textStyle: {
            fontSize: 12,
          },
        },
        tooltip: {
          trigger: 'axis',
        },
        xAxis: [
          {
            data: dateList,
          },
        ],
        yAxis: [{}],
        grid: {
          top: '15%',
          bottom: '5%',
          left: '6%',
          right: '5%',
          containLabel: true,
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
            showSymbol: false,
            data: valueList,
            markPont: {
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
              data: [{ type: 'average' }],
            },
            markArea: {
              data: [[{ xAxis: dateList[10] }, { xAxis: dateList[25] }]],
            },
          },
          // {
          //   type: 'line',
          //   showSymbol: false,
          //   data: valueList,
          //   xAxisIndex: 1,
          //   yAxisIndex: 1,
          // },
        ],
      }
      // 使用刚指定的配置项和数据显示图表。
      this.chartInstance.setOption(option)
      this.$nextTick(() => {
        window.onresize = () => {
          this.chartInstance.resize()
        }
      })
    },
  },
}
</script>