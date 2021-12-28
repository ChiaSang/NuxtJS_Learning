<template>
  <div class="row justify-content-md-center">
    <b-col col lg="4" md="4" sm="10" class="align-items-center">
      <b-card title="新建用户信息">
        <div>
          <b-form-group
            label="id:"
            label-for="nested-id"
            label-cols-sm="4"
            label-align-sm="left"
          >
            <b-form-input
              id="nested-id"
              size="sm"
              v-model="userInfo.id"
            ></b-form-input>
          </b-form-group>

          <b-form-group
            label="name:"
            label-for="nested-name"
            label-cols-sm="4"
            label-align-sm="left"
          >
            <b-form-input
              id="nested-name"
              size="sm"
              v-model="userInfo.name"
            ></b-form-input>
          </b-form-group>

          <b-form-group
            label="time:"
            label-for="nested-time"
            label-cols-sm="4"
            label-align-sm="left"
          >
            <b-form-input
              id="nested-time"
              size="sm"
              type="time"
              v-model="userInfo.time"
            ></b-form-input>
          </b-form-group>

          <b-form-group
            label="sex:"
            label-cols-sm="4"
            label-align-sm="left"
            class="mb-0"
            v-slot="{ ariaDescribedby }"
          >
            <!-- <b-form-radio-group
              class="pt-2"
              :options="['male', 'female', 'secret']"
              :aria-describedby="ariaDescribedby"
            ></b-form-radio-group> -->

            <b-form-select
              size="sm"
              :aria-describedby="ariaDescribedby"
              :options="transport_intentions"
              v-model="userInfo.sex"
            ></b-form-select>
          </b-form-group>
        </div>
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