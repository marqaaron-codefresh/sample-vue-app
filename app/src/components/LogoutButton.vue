<template>
    <b-button variant="danger" size="sm" @click="onLogout()" :disabled="requestingLogout">
        <b-icon v-if="requestingLogout" icon="arrow-clockwise" animation="spin" font-scale="1"></b-icon>
        Logout
    </b-button>
</template>

<script>
import { BButton,BIcon } from 'bootstrap-vue';

export default {
    name: "LogoutButton",
    data(){
        return {
            requestingLogout: false
        }
    },
    methods: {
        onLogout(){
            this.requestingLogout = true;
            this.$store.dispatch('setIsLoggedIn',false).then(
                ()=>{
                    this.requestingLogout = false;
                    this.$router.push('/');
                }
            );
        }
    },
    components: {
        BButton,
        BIcon
    }
}
</script>

<style scoped>

</style>