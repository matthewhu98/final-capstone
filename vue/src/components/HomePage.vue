<template>

  <div class="homepage">
    
    <!-- <div class="header">
      
    </div> -->
   
    <!-- <div class="left-menu"></div> -->
    <div class="content"> <h1 class="titlecard">{{title}}</h1></div>
    <!-- <div class="footer"></div> -->
  </div>


</template>


<script>
export default {
  name: "home-page",
  data() {
    return {
      title: "ROAMING IN ROME"
    };
  }
};
</script>

<style>
 @import url('https://fonts.googleapis.com/css2?family=Open+Sans&family=Poiret+One&display=swap');
*{
  padding: 0;
  margin: 0;
  border: 0;
}

 /* font-family: 'Open Sans', sans-serif; */
.titlecard{
   
font-family: 'Poiret One', cursive;
    letter-spacing: 2px;
    position: relative;
    text-align: center;
    top: 1px;
    font-size: 5vh;
}
.homepage{
  display: block;
  width: 100%;
  overflow: auto;
  margin: 30px auto 0 auto;
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
  display:flex;
  height:auto;
  width:100%;
  margin:10px auto;
  margin-top: 100px;
  padding-top: 10px;
  /* padding: 50px; */
  justify-content: space-around;
}
html{
  background-image: url(../assets/background-home.jpg);
  /* background-image:url(../assets/homepage-image.jpg); */
  background-repeat: no-repeat;
  background-position: center;
  /* background-size: cover; */
  height: auto;
  width:100%;
  min-width: 100%;
  position: fixed;
  min-height: 100%;
  top:0;
  left: 0;
  bottom: 0;
  right:0;
  background-color: 	#b4c2c5; 
}

</style>