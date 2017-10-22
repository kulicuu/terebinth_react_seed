# Profile Home




{ styl_btn_two, styl_options_ctr, styl_ufo, h3_top, styl_btn_one } = require('../styles/ufo.coffee')


comp = rr

    # component

    getInitialState: ->
        c 'in initial state with props', @props
        if @props.hornet.profileCompletion is 'new_hornet'
            interaction_mode: 'introductions'
            intros_state: 'beginning'
        else

            interaction_mode: 'standard'

    componentWillReceiveProps: (nextProps) ->
        # if some condition in the hornet specs it we should start the introductions.
        c 'nextProps', nextProps
        if nextProps.hornet.profileCompletion is 'new_hornet'
            @setState
                interaction_mode: 'introductions'
                intros_state: 'beginning'
        else
            @setState
                interaction_mode: 'standard'



    render: ->
        c 'in render, props are', @props
        c 'nest in props', @props.nest
        switch @state.interaction_mode
            when 'introductions'
                switch @state.intros_state
                    when 'beginning'
                        div {},
                            "beginning introductions"

                            div
                                style:
                                    display: 'flex'
                                idx = 0
                                _.map @props.nest, (v, k) ->
                                    do (v, k) ->
                                        if v isnt undefined
                                            div
                                                key: "hest:#{idx++}"
                                                span null, "#{v.email}"
                                                span null, "#{v.hornetId}"

                            button
                                style: {}
                                "Skip"
                            button
                                style: {}
                                onClick: @props.logout
                                "Logout"

                    else
                        div null, 'continuing introductions'

            else
                div
                    style: styl_ufo()
                    h3
                        style: h3_top()
                        "hornet :: open-source social-media pattern"
                    h3
                        style: h3_top()
                        "user profile hornet cell"

                    button
                        onClick: @props.nav_edit_profile
                        "Edit Profile"

                    div
                        style:
                            display: 'flex'
                        idx = 0
                        _.map @props.nest, (v, k) ->
                            do (v, k) ->
                                if v isnt undefined
                                    div
                                        key: "hest:#{idx++}"
                                        span null, "email #{v.email}"
                                        span null, "id #{v.hornetId}"


                    button
                        style: {}
                        onClick: @props.logout
                        "Logout"


map_state_to_props = (state) ->
    state.get('hornet').toJS()


map_dispatch_to_props = (dispatch) ->

    nav_edit_profile: ->
        dispatch { type: 'nav_edit_profile' }

    logout: ->
        dispatch { type: 'logout' }





exports.default = connect(map_state_to_props, map_dispatch_to_props)(comp)
