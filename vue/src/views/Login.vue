<template>
  <div id="login" class="login-background">
    <form id="login-container" class="form-signin" @submit.prevent="login">
      <h1 id="login-header">Sign in to start Roaming!</h1>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <div>
        <label for="username" class="sr-only">Username</label>
        <input
          type="text"
          id="username"
          class="form-control"
          placeholder="Username"
          v-model="user.username"
          required
          autofocus
        >
      </div>
      <div>
        <label for="password" class="sr-only">Password</label>
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="Password"
          v-model="user.password"
          required
        >
      </div>
      <div>
        <router-link :to="{ name: 'register' }" class="need-account">Need an account?</router-link>
        <div></div>
        <button class="login-button" type="submit">Sign in</button>
      </div>
    </form>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/itineraries/this.$store.state.user.userId");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>
<style>
#username,
#password,
#confirmPassword {
  border: 2px solid white;
  border-radius: 10%;
  height: 1.5vw;
  width: 20vw;
  border-radius: var(--rad);
  transition: all var(--dur) var(--bez);
  transition-property: width, border-radius;
  height: 2.5vw;
  background-color: #b4c2c5;
  padding: 10px;
  margin: 20px;
  font-family: "Open Sans", sans-serif;
}

#login-container,
#register-container {
  visibility: visible;
  opacity: 1;
  background: rgba(255, 255, 255, 0.8);
  width: 600px;
  padding: 60px;
  margin: auto;
  border-radius: 4px;
  position: relative;
  top: 160px;
}

#register-header,
#login-header {
  font-family: "Poiret One", cursive;
  letter-spacing: 2px;
  position: relative;
  text-align: center;
  font-size: 6vh;
  margin: 20px;
  color: #5ba1b0;
}

.need-account,
.have-account {
  color: #b18f69;
  text-transform: uppercase;
  font-size: 20px;
  padding: 15px;
  border-radius: 6px;
  display: inline-block;
  text-decoration: none;
}

.need-account:hover,
.have-account:hover {
  color: #494949 !important;
}

.login-button,
.register-button {
  color: #b18f69;
  text-transform: uppercase;
  font-size: 20px;
  padding: 15px;
  display: inline-block;
  text-decoration: none;
  border: none;
  background: white;
  border-radius: 4px;
}

.login-button:hover,
.register-button:hover {
  background: #5ba1b0;
  color: white;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -ms-transition: all 0.3s;
  transition: all 0.3s;
  backface-visibility: hidden;
  -webkit-backface-visibility: hidden;
  /* Chrome and Safari */
  -moz-backface-visibility: hidden;
  /* Firefox */
  -ms-backface-visibility: hidden;
  /* Internet Explorer */
}

.login-background,
.register-background {
  background-image: url(../assets/background-bridge.jpg);
  background-repeat: no-repeat;
  background-position: center;
  background-size: 100vw;
  min-width: 420px;
  height: 100vh;
  width: 100vw;
  background-attachment: fixed;
  max-width: 100%;
  background-size: cover;
}
</style>
