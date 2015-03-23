(set! after_synth_hooks
          (list
            (lambda (utt)
               (utt.wave.rescale utt 4.0))))
              
(voice.list)