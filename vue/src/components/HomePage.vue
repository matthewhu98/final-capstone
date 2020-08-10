<template class="home">

  <div class="homepage">
    <header>
      test
    </header>
   <nav>
     menu
   </nav>
    <div class="content">
      <h1 class="titlecard">{{title}}</h1>
      <h4>YOUR VIRTUAL TRAVEL PLANNER</h4>
    </div>
    
    <div class="call-to-action">
      <h3>Plan a tour</h3>
      <!-- <div></div> -->
    </div>
  </div>
</template>


<script>
export default {
  name: "home-page",
  data() {
    return {
      title: "ROAMING IN ROME",
    };
  },
};
</script>

<style lang="css" scoped>
/* @import url("https://fonts.googleapis.com/css2?family=Open+Sans&family=Poiret+One&display=swap"); */
* {
  padding: 0;
  margin: 0;
  border: 0;
 
}
.home {
  /* display: block;
  padding: 0;
   background-color: 	#b4c2c5; */
}

/* font-family: 'Open Sans', sans-serif; */
.titlecard {
  font-family: "Poiret One", cursive;
  letter-spacing: 2px;
  position: relative;
  text-align: center;
  font-size: 6vh;
  
  margin: 20px;
   /* background-color: 	#b4c2c5; this is the key bg-color */
}
.homepage {
  display: flex;
  flex-direction: column;
  /* padding: 5rem; */
}
/* .header {
  background-color: 	#b4c2c5;   background color
  float: left;
  clear: none;
  height: 100px;
  width: 100%;
} */
/* .left-menu {
  background-color: black;
  float:left;
  clear: none;
  height: 600px;
  width:30%;
} */
.content {
  /* display: flex; */
  /*height: auto;
  width: 100%;
  margin: 10px auto;
  margin-top: 100px;
  padding-top: 10px;
  padding: 50px; */
  /* justify-content: center; */
}
.call-to-action {
  /*make this a router link*/
  display: flex;
  justify-content: center;
  align-items: center;
  color: #494949 !important;
  text-transform: uppercase;
  text-decoration: none;
  background: #ffffff;
  padding: 15px;
  width: 25%;
  align-self: center;
  border: 4px solid #494949 !important;
  /* display: inline-block; */
  /* transition: all 0.4s ease 0s; */
  border-radius: 10px;

}
.call-to-action:hover {
  color: #ffffff !important;
  background: #23b2dc;
  border-color: #23b2dc !important;
  transition: all 0.4s ease 0s;
}
html {
  /* background-image: url(../assets/background-home.jpg); */
  filter: contrast(130%);
  /* background-image:url(../assets/homepage-image.jpg); */
  background-repeat: no-repeat;
  background-position: center;
  /* background-size: cover; */
  height: auto;
  width: 100%;
  min-width: 100%;
  /* position: fixed; */
  min-height: 100%;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  background-color: #b4c2c5;
  
}
</style>