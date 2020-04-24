<template>
  <div class="card blue-grey darken-1">
    <div class="card-content white-text">
      <span class="card-title">{{ name }}</span>
      <p v-if="exercise.target">{{ target }} {{ measure }}</p>
      <p v-else>-</p>
    </div>
    <div class="card-action">
      <span class="chip green z-depth-1">{{ consumed }} consumed</span>
      <span v-if="target" class="chip pink z-depth-1">{{ target - consumed }} remining</span>
      <a :href="`#add-amount-${name}`" :data-add-amount="`add-amount-${name}`" class="btn btn-small btn-floating right waves-effect waves-light modal-trigger">
        <i class="material-icons">add</i>
      </a>
      <div :id="`add-amount-${name}`" class="modal add-amount">
        <div class="modal-content valign-wrapper container">
          <div class="input-field inline">
            <input :id="`input-${name}`" type="number" v-model.number="toConsume">
            <label :for="`input-${name}`">{{ name }}</label>
          </div>
          <div class="input-field inline">
            <button class="btn btn-floating btn-small modal-close" v-on:click="consume"><i class="material-icons">send</i></button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Exercise',
  props: ['id', 'exercise'],
  data: () => ({
    name: null,
    measure: null,
    target: null,
    consumed: 0,
    toConsume: null,
  }),
  watch: {
    consumed: function(consumed) {
      const exercises = JSON.parse(localStorage.exercises);
      exercises[this.id].consumed = consumed;
      localStorage.exercises = JSON.stringify(exercises);
    },
  },
  methods: {
    consume: function() {
      this.consumed += this.toConsume;

      this.toConsume = 0;
    },
  },
  beforeMount: function() {
    this.name = this.exercise.name;
    this.measure = this.exercise.measure;
    this.target = this.exercise.target;
    this.consumed = this.exercise.consumed;
  },
};
</script>