// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function() {
    $array_length = 0;
    $(".btn.btn-primary.place_block").click(
        function() {
            $(this).toggleClass("btn-warning");
            $a = $('.btn-warning').length
            console.log($a);
            $arr = [];
            $array_length += 1
            $link_id = $(location).attr('href').slice(36);
            $('.btn-warning').each(function() {
                $place_id = $(this).attr('id').slice(6);
                $arr.push($place_id);
            });

            if ($a > 1) {
                $(".test_hide").removeClass("hide");
            } else {
                $(".test_hide").addClass("hide");
            }


            $.ajax({
                url: "/film_sessions/" + $link_id,
                type: "get",
                data: { data_value: $arr, array_length: $array_length },
                complete: function() {},
                success: function(data) {
                    $array_length = $arr.length;
                    if ($('#data2').html() == '') {
                        $('#data2').append(data);
                    } else {
                        $('#data2').empty();
                        $('#data2').append(data);
                    }

                    $("button#close").click(function() {
                        $choosed_place_length = $('.booking_blocks').length - 1
                        console.log($choosed_place_length);
                        $remove_place = this.parentNode;
                        jQuery($remove_place).fadeOut("slow");
                        $arr.splice($arr.indexOf(this.value), 1);
                        console.log($arr);
                    });
                    console.log($array_length);
                },
                error: function() {
                    alert("Ajax error!")
                }
            });
        });

    $("a#group").fancybox({
        'hideOnContentClick': true
    });

    $("a.group").fancybox({
        'transitionIn': 'elastic',
        'transitionOut': 'elastic',
        'speedIn': 600,
        'speedOut': 200,
        'overlayShow': false
    });


    $("a.group2").fancybox({
        'hideOnContentClick': true
    });

    $("a.group2").fancybox({
        'transitionIn': 'elastic',
        'transitionOut': 'elastic',
        'speedIn': 600,
        'speedOut': 200,
        'overlayShow': false
    });

});
