<template>
  <b-container fluid>
    <Bulletin
      :bulletinInfo="bulletinInfo"
      @bulletinIdentifier="getIdentifierHistory"
    />
    <b-row v-show="showPic" class="mt-4" align-v="center">
      <b-col align-self="center">
        <base-line :mainTitle="mainTitle" :picdata="identifierHistory" />
      </b-col>
    </b-row>
    <div class="navbar-fixed-bottom mt-4 text-center">
      <small>河南翰林网络技术开发有限公司 &copy; 废气在线监测</small>
    </div>
  </b-container>
</template>

<script>
import LineGradient from '../components/Charts/LineGradient.vue'
import BaseLine from '../components/Charts/BaseLine.vue'
import Bulletin from '../components/bulletin-board/Bulletin.vue'
export default {
  components: { LineGradient, BaseLine, Bulletin },
  data() {
    return {
      mainTitle: '默认图表',
      bulletinInfo: [],
      identifierHistory: [],
      currentDate: Date.parse(new Date()),
      showPic: false,
    }
  },
  created() {
    this.getBulletinInfo()
  },
  mounted() {
    window.setInterval(() => {
      setTimeout(() => {
        this.getBulletinInfo()
      }, 0)
    }, 5000)
  },
  methods: {
    getBulletinInfo() {
      this.$axios({
        method: 'get',
        url: '/onenet/application?action=QueryDeviceProperty&version=1&project_id=V9tGcb&product_id=MM7lNSfMRo&device_name=ESP32_6d171554',
        headers: {
          authorization:
            'version=2020-05-29&res=userid%2F220127&et=1677247709&method=sha1&sign=sU5NddFTGDsA96GkdrmoEYKndpY%3D',
          'Content-Type': 'application/json',
        },
      }).then((res) => {
        // console.log(res.data.data.list)
        this.bulletinInfo = res.data.data.list
      })
    },
    getIdentifierHistory(identifier) {
      this.mainTitle = identifier
      this.showPic = true
      this.$axios({
        method: 'get',
        url:
          '/onenet/application?action=QueryDevicePropertyHistory&version=1&project_id=V9tGcb&product_id=MM7lNSfMRo&device_name=C45BBE60E459&identifier=' +
          identifier +
          '&limit=100&sort=2&start_time=1645689179000&end_time=' + this.currentDate,
        headers: {
          authorization:
            'version=2020-05-29&res=userid%2F220127&et=1677247709&method=sha1&sign=sU5NddFTGDsA96GkdrmoEYKndpY%3D',
          'Content-Type': 'application/json',
        },
      }).then((res) => {
        // console.log(res.data.data.list)
        this.identifierHistory = res.data.data.list
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

.fluid-container.footer {
  background: text;
}
.fluid-container.footer > *:last-child {
  margin-bottom: 0px;
  color: #fff;
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
