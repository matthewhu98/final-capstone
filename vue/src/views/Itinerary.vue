<template>
  <section class="itinerary">
    <h1 class="text">Your Itinerary</h1>

    <div>
      <the-itinerary></the-itinerary>
    </div>
  </section>
</template>

<script>
import TheItinerary from "@/components/TheItinerary.vue";
export default {
  name: "itinerary",
  components: {
    TheItinerary
  }
};
</script>

<style>
.text {
  color: black;
}
</style>