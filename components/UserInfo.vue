<template>
  <div class="row justify-content-md-center">
    <b-col col lg="2" md="4" sm="10" class="align-items-center">
      <b-card title="新建用户信息">
        <b-row>
          <b-col sm="4">
            <label for="input-small">Id:</label>
          </b-col>
          <b-col sm="8">
            <b-form-input
              id="nested-id"
              size="sm"
              v-model="userInfo.id"
            ></b-form-input>
          </b-col>
        </b-row>
        <b-row>
          <b-col sm="4">
            <label for="input-small">Name:</label>
          </b-col>
          <b-col sm="8">
            <b-form-input
              id="nested-name"
              size="sm"
              v-model="userInfo.name"
            ></b-form-input>
          </b-col>
        </b-row>
        <b-row>
          <b-col sm="4">
            <label for="input-small">Time:</label>
          </b-col>
          <b-col sm="8">
            <b-form-input
              id="nested-time"
              size="sm"
              type="time"
              v-model="userInfo.time"
            ></b-form-input
          ></b-col>
        </b-row>
        <b-row>
          <b-col sm="4">
            <label for="input-small">Sex:</label>
          </b-col>
          <b-col sm="8">
            <b-form-select
              size="sm"
              :options="transport_intentions"
              v-model="userInfo.sex"
            ></b-form-select
          ></b-col>
        </b-row>
        <div class="mt-3 text-center">
          <b-button variant="outline-secondary" @click.prevent="createNew"
            >提交信息</b-button
          >
        </div>
      </b-card>
    </b-col>
  </div>
</template>
<script>
import vueQr from 'vue-qr'
export default {
  components: {
    vueQr,
  },
  data() {
    return {
      transport_intentions: [
        { text: '请选择', value: null },
        '中转贮存',
        '利用',
        '处理',
        '处置',
        '其他',
      ],
      userInfo: {
        id: null,
        name: null,
        time: null,
        sex: null,
      },
    }
  },
  methods: {
    createNew() {
      this.$emit('userAdded', this.userInfo)
      this.userInfo = {}
    },
  },
}
</script>