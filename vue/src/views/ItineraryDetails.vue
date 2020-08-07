<template>
  <div class="itinerary-details">
      <div>
          <itinerary-details v-bind:itineraryID="parseInt($route.params.id)"/>
      </div>
  </div>
</template>

<script>
import ItineraryDetails from '@/components/ItineraryDetails.vue';
export default {
    name: 'itinerarydetails',
    components: {
        ItineraryDetails
    }
}
</script>

<style>

</style>