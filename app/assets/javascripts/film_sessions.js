$(document).ready(function() {

    $array_length = 0;
    $(".btn.btn-primary.place_block").click(
        function() {

            $(this).toggleClass("btn-warning");

            $arr = [];
            $array_length += 1 ;
            $link_id = $(location).attr('href').slice(36);

            $('.btn-warning').each(function() {
                $place_id = $(this).attr('id');
                $place_id = $place_id.slice(6);
                $arr.push($place_id);


                if ($arr.length > 1) {
                    $(".test_hide").removeClass("hide");
                    $(".hidden-block").addClass("hide");
                } else {
                    $(".test_hide").addClass("hide");
                    $(".hidden-block").removeClass("hide");
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
                            $choosed_place_length = $('.booking_blocks').length - 1;
                            $remove_place = this.parentNode;
                            jQuery($remove_place).fadeOut("slow");
                            $arr.splice($arr.indexOf(this.value), 1);;
                        });
                    },
                    error: function() {
                        alert("Ajax error!")
                    }
                });
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
