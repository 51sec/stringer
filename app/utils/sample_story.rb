# frozen_string_literal: true

SAMPLE_BODY = <<~HTML
  <p>Tofu shoreditch intelligentsia <a href="#">umami</a>, fashion axe photo booth
  try-hard terry richardson quinoa actually fingerstache meggings fixie. Aesthetic
  salvia vinyl raw denim, keffiyeh master cleanse tonx selfies mlkshk occupy twee
  street art gentrify. Quinoa PBR readymade 90's. <b>Chambray</b> Austin aesthetic
  meggings, carles vinyl intelligentsia tattooed. Keffiyeh mumblecore
  fingerstache, sartorial sriracha disrupt biodiesel cred. Skateboard yr cosby
  sweater, narwhal beard ethnic jean shorts aesthetic. Post-ironic flannel mlkshk,
  pickled VHS wolf banjo forage portland wayfarers.</p>
  <img src='https://placekitten.com/g/500/300' />
  <p>Selfies mumblecore odd future <a href="#">irony DIY messenger bag</a>.
  Authentic neutra next level selvage squid. Four loko freegan occupy, tousled
  vinyl leggings selvage messenger bag. Four loko wayfarers kale chips, next level
  banksy banh mi umami flannel hella. Street art odd future scenester,
  intelligentsia brunch fingerstache YOLO narwhal single-origin coffee tousled
  tumblr pop-up four loko you probably haven't heard of them dreamcatcher.
  Single-origin coffee direct trade retro biodiesel, truffaut fanny pack portland
  blue bottle scenester bushwick. Skateboard squid fanny pack bushwick, photo
  booth vice literally.</p>
HTML

SampleStory =
  Struct.new(:source, :title, :lead, :is_read, :published) do
    def id
      rand(100) * -1
    end

    def headline
      title
    end

    def permalink
      "#"
    end

    def lead
      "Tofu shoreditch intelligentsia umami, fashion axe photo booth try-hard"
    end

    def body
      SAMPLE_BODY
    end

    def is_read
      false
    end

    def keep_unread
      false
    end

    def is_starred
      false
    end

    def published
      Time.now
    end

    def as_json(_options = {})
      {
        id:,
        headline:,
        lead:,
        source:,
        title:,
        pretty_date: published.strftime("%A, %B %d"),
        body:,
        permalink:,
        is_read:,
        is_starred:,
        keep_unread:
      }
    end
  end
