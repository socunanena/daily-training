<template>
  <div class="card blue-grey darken-1">
    <div class="card-content white-text">
      <span class="card-title">{{ exercise.name }}</span>
      <p v-if="exercise.target">{{ exercise.target }} {{ exercise.measure }}</p>
      <p v-else>-</p>
      <a class="btn btn-small btn-flat btn-floating delete-exercise" @click="$emit('deleteExercise', exercise)">
        <i class="material-icons">clear</i>
        <!-- <i class="material-icons">delete</i> -->
      </a>
    </div>
    <div class="card-action">
      <span class="chip green z-depth-1">{{ exercise.consumed }} consumed</span>
      <span v-if="exercise.target" class="chip pink z-depth-1">{{ exercise.target - exercise.consumed }} remining</span>
      <a :href="`#add-amount-${exercise.name}`" :data-add-amount="`add-amount-${exercise.name}`" class="btn btn-small btn-floating right waves-effect waves-light modal-trigger">
        <i class="material-icons">add</i>
      </a>
      <div :id="`add-amount-${exercise.name}`" class="modal add-amount">
        <div class="modal-content valign-wrapper container">
          <div class="input-field inline">
            <input :id="`input-${exercise.name}`" type="number" v-model.number="toConsume">
            <label :for="`input-${exercise.name}`">{{ exercise.name }}</label>
          </div>
          <div class="input-field inline">
            <button class="btn btn-floating btn-small modal-close" @click="consume"><i class="material-icons">send</i></button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Exercise',
  props: ['exercise'],
  data: () => ({
    toConsume: null,
  }),
  methods: {
    consume: function() {
      this.$emit('consume', this.toConsume);

      this.toConsume = null;
    },
  },
};
</script>

<style scoped>
  .delete-exercise {
    position: absolute;
    top: 0;
    right: 0;
  }
</style>
