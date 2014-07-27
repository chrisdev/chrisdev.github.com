module.exports = function(grunt) {
  grunt.initConfig({
    /* your grunt-imageoptim configuration goes here */
    imageoptim: {
        myTask: {
            src: ['theme/images', 'content/images']
        }
    }
  });
  grunt.loadNpmTasks('grunt-imageoptim');

  grunt.registerTask('default', ['imageoptim']);
};
