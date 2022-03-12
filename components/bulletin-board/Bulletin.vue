<template>
  <div>
    <b-row align-h="end">
      <b-col class="col text-right">
        <div text-variant="light">
          <small class="text-muted">
            数据截止:{{ this.updatetime }}
            <p></p>
          </small>
        </div>
      </b-col>
    </b-row>

    <b-row>
      <b-col
        col
        lg="3"
        md="4"
        sm="12"
        xs="12"
        class="mt-4"
        v-for="item in bulletinInfo"
        :key="item.identifier"
        @click="postIdentifier(item.identifier)"
      >
        <b-card align="center" text-variant="info">
          <b-card-sub-title
            sub-title-text-variant="info"
            class="small sub-title-muted"
          >
            {{ item.name }}
          </b-card-sub-title>
          <b-card-title title-tag="h2" text-variant="info">
            {{ item.value }}
          </b-card-title>
          <b-card-sub-title
            sub-title-text-variant="info"
            class="small sub-title-muted"
            >{{ item.identifier }}</b-card-sub-title
          >
        </b-card>
      </b-col>
    </b-row>
  </div>
</template>

<script>
export default {
  props: {
    bulletinInfo: {
      type: Array,
      requires: true,
      default: function () {
        return {}
      },
    },
  },
  data() {
    return { updatetime: '' }
  },
  updated() {
    // DOM全部渲染完毕后执行
    this.updatetime = this.convertTimestamp(parseInt(this.bulletinInfo[0].time))
  },
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
    // updateTime(){
    //   this.updatetime =  this.convertTimestamp(parseInt(this.bulletinInfo[0].time))
    //   console.log(this.convertTimestamp(parseInt(this.bulletinInfo[0].time)))
    // },
    isIncr(incr) {
      return incr >= 0 ? '+' + incr : incr
    },
    postIdentifier(identifier) {
      this.$emit('bulletinIdentifier', identifier)
    },
  },
}
</script>

<style>
</style>