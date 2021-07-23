<template>
  <div class="container">
    <b-form>
      <b-form-group v-for="item in base_items" :key="item" :label="item">
        <div v-if="item === '外运目的:'">
          <b-form-select
            v-model="n1"
            :options="transport_intentions"
          ></b-form-select>
        </div>
        <div v-else-if="item === '废物处理方式:'">
          <b-form-select
            v-model="n2"
            :options="disposal_methods"
          ></b-form-select>
        </div>
        <div v-else><b-form-input :placeholder="item"></b-form-input></div>
      </b-form-group>
      <b-button variant="primary">生成二维码</b-button>
    </b-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      base_items: [
        '产生单位:',
        '电话:',
        '通信地址:',
        '邮编:',
        '运输单位:',
        '电话:',
        '电话:',
        '通信地址:',
        '邮编:',
        '接收单位:',
        '通信地址:',
        '邮编:',
        '货物名称:',
        '各类编号:',
        '废物状态（含水率%）:',
        '包装方式:',
        '批次:',
        '数量:',
        '外运目的:',
        '发运人:',
        '运达地:',
        '转移时间:',
        '第一承运公司:',
        '运输日期:',
        '运输次数:',
        '运输起点:',
        '运输终点:',
        '运输人签字:',
        '第二承运公司:',
        '运输日期:',
        '运输次数:',
        '运输起点:',
        '运输终点:',
        '运输人签字:',
        '经营许可证号:',
        '接收人:',
        '接收日期:',
        '废物处理方式:',
        '单位负责人签字:',
        '日期:',
      ],
      n1: null,
      n2: null,
      transport_intentions: [
        { text: '请选择', value: null },
        '中转贮存',
        '利用',
        '处理',
        '处置',
        '其他',
      ],
      disposal_methods: [
        { text: '请选择', value: null },
        '利用',
        '贮存',
        '焚烧',
        '安全填埋',
        '其他',
      ],
    }
  },
  methods: {
    genQrCode() {
      qrcode.makeCode(elText.value)
    },
  },
}
</script>

<style scoped>
.container {
  max-width: 800px;
}
</style>