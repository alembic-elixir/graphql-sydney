defmodule GraphqlSydney.Web.PageView do
  use GraphqlSydney.Web, :view

  @meetup_time "6:00pm - 8:30pm"

def markdown_to_html(markdown) do
  {:safe, Earmark.as_html!(markdown)}
end

def short_date(date) do
  Timex.format!(date, "{Mfull} {YYYY}")
end

def long_date(date) do
  Timex.format!(date, "{WDfull}, {D} {Mfull} {YYYY}")
end

def short_month(date) do
  Timex.format!(date, "{Mshort}")
end

def display_date_time(meetup) do
  case meetup.slug do
    _ -> "#{long_date(meetup.date)}, #{@meetup_time}"
  end
end

def json_ld_for_meetups(meetups, opts \\ [pretty: true]) do
  {:safe, """
  <script type="application/ld+json">
    #{meetups |> Enum.map(&to_ld_json(&1)) |> Poison.encode!(opts)}
  </script>
  """}
end

defp to_ld_json(meetup) do
  %{
    "@context": "http://schema.org",
    "@type": "Event",
    "name": meetup.title,
    "description": meetup.description,
    "url": meetup.url,
    "startDate": meetup.date,
    "endDate": meetup.date,
    "location": %{
      "@type": "Place",
      "name": meetup.location.name,
      "address": %{
        "@type": "PostalAddress",
        "streetAddress": meetup.location.street_address,
        "addressLocality": meetup.location.suburb,
        "addressRegion": meetup.location.state,
        "postalCode": meetup.location.postcode,
        "addressCountry": meetup.location.country
      }
    }
  }
end

end
