<template class="home">
  <div class="homepage">
    <div class="content">
      <h1 class="titlecard">{{title}}</h1>
      <h4 class="subtext">Your virtual travel planner</h4>
    </div>

    <div>
      <router-link class="call-to-action" v-bind:to="{ name: 'the-landmarks'}">Plan a Tour</router-link>
    </div>
    <div class="text-grid">
      <div class="our-mission">
        <img class="img" src="../assets/our-mission.jpg">
        <h3>Our Mission</h3>
        <p
          class="text"
        >Roaming in Rome is a powerful trip planning tool that helps families and individuals achieve their customized dream vacation.</p>
      </div>
      <div class="about-us">
        <img class="img" src="../assets/home-about-us.jpg">
        <h3>About Us</h3>
        <p
          class="text"
        >Our company was founded when a group of adult prodigies got together and discovered their mutual passion for all things coding/Rome-related.</p>
      </div>
      <div class="join-team-golf">
        <img class="img" src="../assets/join-team-golf.jpg">
        <h3>Join our Team</h3>
        <p
          class="text"
        >Whether you are looking for the vacation of a lifetime, or for new career opportunities, we can't wait to hear from you!</p>
      </div>
    </div>
    <i class="fab fa-twitter-square icon fa-2x"></i>
    <i class="fab fa-facebook-square icon fa-2x"></i>
    <i class="fab fa-youtube-square icon fa-2x"></i>
    <i class="fab fa-linkedin icon fa-2x"></i>
  </div>
</template>


<script>
export default {
  name: "home-page",
  data() {
    return {
      title: "Roaming in Rome"
    };
  }
};
</script>

<style lang="css" scoped>
/* @import url("https://fonts.googleapis.com/css2?family=Open+Sans&family=Poiret+One&display=swap"); */
* {
  padding: 0;
  margin: 0;
  border: 0;
}

.icon {
  color: white;
  margin-right: 20px;
  margin-left: 15px;
  margin-bottom: 50px;
  size: 3x;
}
.icon:hover {
  filter: drop-shadow(5px 5px 5px rgba(0, 0, 0, 0.6));
}

.text-grid {
  display: grid;
  align-items: center top;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-areas: ".our-mission .about-us .join-team-golf";
  background: rgba(255, 255, 255, 0.8);
  margin: 80px;
  border-radius: 4px;
}

img {
  height: 200px;
  width: 200px;
  margin: 20px;
  border-radius: 3px;
  filter: drop-shadow(10px 10px 10px rgba(0, 0, 0, 0.6));
}

.our-mission,
.about-us,
.join-team-golf {
  padding: 30px;
  border-radius: 4px;
}

.our-mission:hover,
.about-us:hover,
.join-team-golf:hover {
  background: white;
  border-radius: 4px;
}

.text {
  text-align: left;
}

.titlecard {
  font-family: "Poiret One", cursive;
  text-transform: uppercase;
  letter-spacing: 2px;
  text-align: center;
  font-size: 90px;
  font-weight: bold;
  filter: drop-shadow(10px 10px 10px rgba(0, 0, 0, 0.6));
  margin: 30px;
  padding-top: 60px;
}

.subtext {
  color: #494949;
  text-transform: uppercase;
  font-size: 25px;
  display: inline-block;
  text-decoration: none;
}

.call-to-action {
  color: #e6b054;
  text-transform: uppercase;
  font-size: 25px;
  padding: 20px;
  margin: 60px;
  display: inline-block;
  text-decoration: none;
  border: none;
  background: white;
  filter: drop-shadow(10px 10px 10px rgba(0, 0, 0, 0.6));
  border-radius: 4px;
}

.call-to-action:hover {
  background: #e2a92d;
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
  filter: none;
}
</style>