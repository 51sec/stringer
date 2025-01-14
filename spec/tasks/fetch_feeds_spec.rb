# frozen_string_literal: true

require "spec_helper"
require "support/active_record"

describe FetchFeeds do
  describe "#fetch_all" do
    let(:feeds) { build_pair(:feed) }
    let(:fetcher_one) { instance_double(FetchFeed) }
    let(:fetcher_two) { instance_double(FetchFeed) }
    let(:pool) { double }

    it "calls FetchFeed#fetch for every feed" do
      allow(pool).to receive(:process).and_yield
      allow(FetchFeed).to receive(:new).and_return(fetcher_one, fetcher_two)

      expect(fetcher_one).to receive(:fetch).once
      expect(fetcher_two).to receive(:fetch).once

      expect(pool).to receive(:shutdown)

      described_class.new(feeds, pool).fetch_all
    end

    it "finds feeds when run after a delay" do
      allow(pool).to receive(:process).and_yield
      allow(FetchFeed).to receive(:new).and_return(fetcher_one, fetcher_two)
      expect(FeedRepository)
        .to receive(:fetch_by_ids).with(feeds.map(&:id)).and_return(feeds)
      expect(fetcher_one).to receive(:fetch).once
      expect(fetcher_two).to receive(:fetch).once

      expect(pool).to receive(:shutdown)

      described_class.new(feeds, pool).prepare_to_delay.fetch_all
    end
  end

  describe "#prepare_to_delay" do
    it "serializes the instance for backgrounding" do
      feeds = create_pair(:feed)
      feeds_ids = feeds.map(&:id)
      fetch_feeds = described_class.new(feeds)

      fetch_feeds.prepare_to_delay

      expect(fetch_feeds.instance_variable_get(:@feeds)).to be_empty
      expect(fetch_feeds.instance_variable_get(:@feeds_ids)).to eq(feeds_ids)
    end
  end

  describe ".enqueue" do
    it "enqueues a fetch_all job" do
      feeds = create_pair(:feed)
      feeds_ids = feeds.map(&:id)

      expect { described_class.enqueue(feeds) }
        .to change(Delayed::Job, :count).by(1)

      job_object = Delayed::Job.last.payload_object.object
      expect(job_object.instance_variable_get(:@feeds_ids)).to eq(feeds_ids)
    end
  end
end
