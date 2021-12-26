<template>
  <b-container>
    <b-card>
      <b-row>
        <b-form v-for="(item, i) in base_items" :key="item" :label="item">
          <b-col>
            <b-form-group v-if="item === '外运目的:'">
              <b-form-select
                v-model="n1"
                :options="transport_intentions"
              ></b-form-select>
            </b-form-group>
            <span v-else
              ><b-form-input :placeholder="item"></b-form-input
            ></span>
          </b-col>
        </b-form>
      </b-row>
      <b-row>
        <b-col>
          <vue-qr
            :logoSrc="imageHeadUrl"
            :text="Top_up_balance"
            :size="200"
          ></vue-qr>
        </b-col>
        <b-col>
          <b-button v-on:click="genQRCode()" variant="primary"
            >生成二维码</b-button
          >
        </b-col>
      </b-row>
    </b-card>
  </b-container>
</template>

<script>
import vueQr from 'vue-qr'
export default {
  components: {
    vueQr,
  },
  data() {
    return {
      base_items: ['户号:', '姓名:', '电话:', '表编号:', '外运目的:', '日期:'],
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
      imageHeadUrl: '', //必须是require引入，否则不生效，或者报错
      Top_up_balance: '',
    }
  },
  methods: {
    genQRCode() {
      this.imageHeadUrl = require('../assets/images/hbj.jpeg')
      this.Top_up_balance = this.n1 + this.n2
    },
  },
}
</script>

<style scoped>
.container {
  max-width: 800px;
}
.form-group {
  margin-bottom: 1rem;
}
</style>