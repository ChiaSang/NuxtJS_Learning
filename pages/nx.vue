<template>
  <div>
    <user-info @userAdded="newUser"></user-info>
    <b-row>
      <b-col
        col
        lg="4"
        md="4"
        sm="12"
        v-for="(user, index) in userList"
        :key="index"
      >
        <b-card no-body class="overflow-hidden" @click="deleteUser(index)">
          <b-row
            no-gutters
            class="align-items-center justify-content-md-center"
          >
            <b-col col lg="5" md="5" sm="5">
              <vue-qr
                :logoSrc="imageHeadUrl"
                :text="QRCodeData"
                :size="100"
              ></vue-qr>
            </b-col>
            <b-col col lg="7" md="7" sm="7">
              <div>
                <div>name:{{ user.name }}</div>
                <div>id:{{ user.id }}</div>
                <div>sex:{{ user.sex }}</div>
                <div>time:{{ user.time }}</div>
              </div>
            </b-col>
          </b-row>
        </b-card>
      </b-col>
    </b-row>
  </div>
</template>

<script>
import vueQr from 'vue-qr'
import UserInfo from '../components/UserInfo.vue'
export default {
  components: {
    vueQr,
    UserInfo,
  },
  data() {
    return {
      base_items: ['户号:', '姓名:', '电话:', '表编号:', '外运目的:', '日期:'],
      userList: [],
      imageHeadUrl: '', //必须是require引入，否则不生效，或者报错
      QRCodeData: '',
    }
  },
  methods: {
    genQRCode(user) {
      this.imageHeadUrl = require('../assets/images/hbj.jpeg')
      this.QRCodeData = JSON.stringify(user)
    },
    newUser(user) {
      console.log(`接收: ${JSON.stringify(user)}`)
      this.userList.push(user)
      this.genQRCode(user)
      console.log(`数组接收: ${JSON.stringify(this.userList)}`)
    },
    deleteUser(index) {
      this.userList.splice(index, 1)
    },
  },
}
</script>
<style>
.card-qr {
  float: none;
  display: inline-block;
  vertical-align: middle;
}
</style>